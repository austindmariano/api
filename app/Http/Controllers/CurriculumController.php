<?php

namespace App\Http\Controllers;

use App\Curriculum;
use App\CurriculumSubject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class CurriculumController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      $user = Auth::user();
      //Check if user has permission to view curriculum records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.curriculum_management'), 'read_priv');
      if ($isAuthorized) {
        // NOTE:  Added a filter for College and Senior High Curriculums (November 6, 2019)
        if($request->query() != null){
            if($request->query('level')=="college") {
                // return only those curriculums for college
                $curriculums = Curriculum::with('course', 'curriculum_subjects')->where('course_id', '!=', null)->get();
            } else if($request->query('level')=="shs") {
                // return only those curriculums for shs
                $curriculums = Curriculum::with('strand', 'curriculum_subjects')->where('strand_id', '!=', null)->get();
            } else {
              return response()->json([
                  'message' => 'Invalid parameter or parameter value. Please refer to the API documentation.'
              ],400);     //400: Bad request
            }
        }else{
            $curriculums = Curriculum::orderBy('id', 'DESC')->with('curriculum_subjects', 'course')->get();
        }

        //$curriculums = Curriculum::all();
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the list of curriculums.',
            'time' => Carbon::now()
        ]);
        // $curriculums->makeHidden(['course_id', 'strand_id']);
        return $curriculums;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the list of curriculums.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view curriculum records.'
          ],401);     //401: Unauthorized
      }

    } // end of function index()

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      $user = Auth::user();
      //  check if user have the priviledge to create curriculum record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.curriculum_management'), 'create_priv');
      if ($isAuthorized) {
        $validator = Validator::make($request->all(),[
          'curriculum_title' => 'required|unique:curriculums,curriculum_title|string',
          'curriculum_desc' => 'required|string',
          'course_id' => 'nullable|numeric',
          'strand_id' => 'nullable|numeric'
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new curriculum record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $curriculum_data = $request->all();
          $curriculum_data['last_updated_by'] = Auth::user()->id;
          if (empty($curriculum_data['course_id']) && empty($curriculum_data['strand_id'])) {
            return response()
            ->json([
              'message' => 'Failed to create new curriculum record.',
              'errors' => [
                'curriculum' => ['The curriculum should belong to atleast one course or one strand.']
              ]
            ], 400); // 400: Bad request
          }else {
            try {
              $curriculum = Curriculum::create($curriculum_data);
              // check if record is successfully created.
              if ($curriculum) {
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => $user->id,
                    'activity' => 'Created a new curriculum.',
                    'time' => Carbon::now()
                ]);
                return response()->json(['message' => 'New curriculum record successfully created.'], 200);
              }else {
                return response()->json(['message' => 'Failed to create new curriculum record.'], 500); // server error
              }
            } catch (Exception $e) {
              report($e);
              return false;
            }
          }
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to create a new curriculum.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to create curriculum records.'
          ], 401); // 401: Unauthorized
      }

    } // end of function store()

    /**
     * Display the specified resource.
     *
     * @param  \App\Curriculum  $curriculum
     * @return \Illuminate\Http\Response
     */
    public function show(Curriculum $curriculum)
    {
      $user = Auth::user();
      //Check if user has permission to view instructors
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.curriculum_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the details of ' . $curriculum->curriculum_title . '.',
            'time' => Carbon::now()
        ]);

        if($curriculum->course_id != null){
            $curriculum = Curriculum::where('id', $curriculum->id)->with('course')->get();
        }elseif($curriculum->strand_id != null){
            $curriculum = Curriculum::where('id', $curriculum->id)->with('strand')->get();
        }
        return $curriculum;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the details of ' . $curriculum->curriculum_title . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view curriculum records.'
          ],401); // 401 Unauthorized
      }
    } // end of function show()

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Curriculum  $curriculum
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Curriculum $curriculum)
    {
      $user = Auth::user();
      // check if user have the priviledge to update curriculum record.

      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.curriculum_management'), 'update_priv');

      if($isAuthorized){
        // Only submit this value if it was changed
        // Added to avoid unique contraint violation
        if($curriculum->curriculum_title == $request['curriculum_title']) {
          $newData = $request->except('curriculum_title');
        } else {
          $newData = $request->all();
        }
        $validator = Validator::make($newData,[
          'curriculum_title' => 'unique:curriculums,curriculum_title|string',
          'curriculum_desc' => 'string',
          'course_id' => 'nullable|numeric',
          'strand_id' => 'nullable|numeric'
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update curriculum record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $curriculum_data = $request->all();
          $curriculum_data['last_updated_by'] = Auth::user()->id;
            try {
              $check = $curriculum->update($curriculum_data);
              // check if record is successfully updated.
              if ($check) {
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => $user->id,
                    'activity' => 'Updated the curriculum ' . $curriculum->curriculum_title . '.',
                    'time' => Carbon::now()
                ]);
                return response()->json(['message' => 'Curriculum record successfully updated.'], 200);
              }else {
                return response()->json(['message' => 'Failed to update curriculum record.'], 500); // server error
              }
            } catch (Exception $e) {
              report($e);
              return false;
            }
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to update the details of ' . $curriculum->curriculum_title . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to update curriculum records.'
          ], 401); // 401: Unauthorized
      }
    } // end of function update()

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Curriculum  $curriculum
     * @return \Illuminate\Http\Response
     */
    public function destroy(Curriculum $curriculum)
    {
      $user = Auth::user();
      //  check if user has the priviledge to delete curriculum record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.curriculum_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $curriculum->delete();
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Deleted the curriculum ' . $curriculum->curriculum_title . '.',
              'time' => Carbon::now()
          ]);
          return response()->json(['message' => 'Curriculum record successfully deleted.'], 200);
        } catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to delete the curriculum ' . $curriculum->curriculum_title . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete curriculum records.'
          ],401); // 401: Unauthorized
      }

    } // end of function destroy()

    public function getCurriculumSubjects(Curriculum $curriculum, Request $request){
      if($request->query('year_level') != null && $request->query('semester_id') == null){
        // will return subjects of specified curriculum with filter
          return $curriculum->curriculum_subjects()
          ->orderBy('id', 'DESC')
          ->where('curriculum_id', $curriculum->id)
          ->where('year_level', $request->query('year_level'))
          ->get();
      }elseif ($request->query('year_level') != null && $request->query('semester_id') != null) {
        return $curriculum->curriculum_subjects()
        ->orderBy('id', 'DESC')
        ->where('curriculum_id', $curriculum->id)
        ->where('semester_id', $request->query('semester_id'))
        ->where('year_level', $request->query('year_level'))
        ->get();
      }else{
        return $curriculum->curriculum_subjects()->orderBy('id', 'DESC')->get();
      }
  } // end of function getCurriculumSubjects

    public function test(Curriculum $curriculum){
      $user = Auth::user();
      //Check if user has permission to view instructors
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.curriculum_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the subjects of curriculum ' . $curriculum->curriculum_title . '.',
            'time' => Carbon::now()
        ]);
        // original code
        // return $curriculum->curriculum_subjects;

        // well formed json output
        $myArr = [];
        $i = 0;
        foreach ($curriculum->curriculum_subjects as $curriculum_subject) {
          $myArr[$i] = array(
            'id' => $curriculum_subject->id,
            'subject' => array(
              'subject_id' => $curriculum_subject->subject_id,
              "subject_code" => $curriculum_subject->subject->subject_code,
              "subject_description" => $curriculum_subject->subject->subject_description,
              "year_level" => $curriculum_subject->year_level,
              "units" => $curriculum_subject->subject->units,
              "lec" => $curriculum_subject->subject->lec,
              "lab" => $curriculum_subject->subject->lab,
              "active" => $curriculum_subject->subject->active
            ),
            'semester' => array(
              'semester_id' => $curriculum_subject->id ,
              'semester_id' => $curriculum_subject->semester
            ),
            'created_at' => $curriculum_subject->created_at,
            'updated_at' => $curriculum_subject->created_at,
          );
          $i++;
        }
        return $myArr;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the subjects of curriculum ' . $curriculum->curriculum_title . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view curriculum records.'
          ],401); // 401: Unauthorized
      }
    } // end of function showCurriculumSubjects
}
