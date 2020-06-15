<?php

namespace App\Http\Controllers;

use App\Subject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\QueryException;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class SubjectController extends Controller
{
    /**
     * Display a listing of all subject records.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = Auth::user();
        //Check if user has permission to view subjects
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.subject_management'), 'read_priv');
        if ($isAuthorized) {
            if($request->query() != null){
                if($request->query('sort')!=null){
                    if($request->query('sort')!=""){
                        $subjects = Subject::orderBy($request->query('sort'))->get();
                    }else{
                        $subjects = Subject::orderBy('subject_code', 'asc')->get();
                    }
                }else{
                    $subjects = Subject::where($request->query())->get();
                }
            }else{
                // return all subjects
                 // $subjects = Subject::all();
                 // return all subject in DESC using ID
                 $subjects = Subject::orderBy('id', 'DESC')->get();;
                 // ascending order using subject code
                 // $subjects = Subject::orderBy('subject_code', 'asc')->get();;

            }
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Viewed the list of subjects.',
                'time' => Carbon::now()
            ]);
            return $subjects;
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to view the list of subjects.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view subject records.'
            ],401);     //401: Unauthorized
        }
    } //end of function index()

    /**
     * Create new subject record.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //check if user has priviledge to create subject record
        $user = Auth::user();
        //Check if user has permission to view instructors
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.subject_management'), 'create_priv');
        if ($isAuthorized) {
            $validator = Validator::make($request->all(),[
                'subject_code' => 'required|unique:subjects,subject_code',
                'subject_title' => 'required|string',
                'subject_description' => 'nullable|string',
                'units' => 'required|numeric',
                'lec' => 'required|numeric',
                'lab' => 'required|numeric',
                'active' => 'required|boolean',
            ]);

            // if data validation fails
            if ($validator->fails()) {
                return response()
                ->json([
                    'message' => 'Failed to create a new subject.',
                    'errors' => $validator->errors()
                ], 400); // Bad request, returns an error message
            }
            else {
                try {
                    $subjectData = $request->all();
                    $subjectData['subject_code'] = strtoupper($subjectData['subject_code']);
                    // $subjectData['subject_description'] = ucwords($subjectData['subject_description']);
                    $subjectData['last_updated_by'] = Auth::user()->id;

                    // check if subject has laboratory
                    if ($subjectData['lab'] == 1){
                      $subject_title = $subjectData['subject_title'];
                      for ($i=0; $i < 2; $i++) {
                        if ($i == 0){
                          // stores the lecture subject
                          $subjectData['units'] = 2;
                          $subjectData['lec'] = 2;
                          $subjectData['lab'] = 0;
                          $subjectData['subject_title'] = $subjectData['subject_title'] . " - LEC";
                        }
                        if ($i == 1){
                          // store the laboratory subject
                          $subjectData['units'] = 1;
                          $subjectData['lec'] = 0;
                          $subjectData['lab'] = 1;
                          $subjectData['subject_code'] .= "-L";
                          $subjectData['subject_title'] = $subject_title . " - LAB";
                        }
                        $subject = Subject::create($subjectData);
                      }
                    }else{
                      $subject = Subject::create($subjectData);
                    }

                    // $subject = Subject::create($subjectData);
                    if ($subject) {
                        //record in activity log
                        $activityLog = ActivityLog::create([
                            'user_id' => $user->id,
                            'activity' => 'Created a new subject.',
                            'time' => Carbon::now()
                        ]);
                        return response()->json(['message' => 'New subject record successfully created.'], 201);
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
                'activity' => 'Attempted to create a new subject.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to create subject records.'
            ],401); // 401: Unauthorized
        }

    } // end of function store()

    /**
     * Display the specified subject record.
     *
     * @param  \App\Subject  $subject
     * @return \Illuminate\Http\Response
     */
    public function show(Subject $subject)
    {
        $user = Auth::user();
        //Check if user has permission to view instructors
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.subject_management'), 'read_priv');

        if($isAuthorized){
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Viewed the details of ' . $subject->subject_description . '.',
                'time' => Carbon::now()
            ]);
            return $subject;
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to view the details of ' . $subject->subject_description . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view subject records.'
            ],401); // 401: Unauthorized
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Subject  $subject
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Subject $subject)
    {
        $user = Auth::user();
        //Check if user has permission to view instructors
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.subject_management'), 'update_priv');

        if($isAuthorized){
          $withLab = $request['subject_code'] . "-L";
            if($subject->subject_code == $request['subject_code']){
              $newData = $request->except('subject_code');
            }
            else {
              $newData = $request->all();
            }
            $validator = Validator::make($newData,[
                'subject_code' => 'unique:subjects,subject_code|max:10',
                'subject_title' => 'required|string',
                'subject_description' => 'nullable|string',
                'units' => 'nullable|numeric',
                'lec' => 'nullable|numeric',
                'lab' => 'nullable|numeric',
                'active' => 'nullable|boolean|numeric',
            ]);

            // if data validation fails
            if ($validator->fails()) {
                return response()
                ->json([
                    'message' => 'Failed to update subject record.',
                    'errors' => $validator->errors()
                ], 400); // 400: Bad request, returns an error message
            }
            else {
                $newData['last_updated_by'] = Auth::user()->id;
                try {
                  // check if subject is lab or lec
                  if ($subject->lab > 0) {
                    if($subject->subject_code == $request['subject_code']){

                      // find the lecture of the lab subject
                      // $search = trim($subject->subject_code, "-L");
                      $search = str_replace("-L","", $subject->subject_code);
                      // Query for search
                      $result = Subject::where('subject_code', $search)
                      ->update([
                        'subject_title' => $newData['subject_title'],
                        'subject_description' => $newData['subject_description'],
                      ]);

                      // update the current lab
                      $subject->update($newData);

                      return response()->json(["message" => "Subject record successfully updated."], 200);


                    }else{
                      // find the lecture of the lab subject
                      // $search = trim($subject->subject_code, "-L");
                      $search = str_replace("-L","", $subject->subject_code);
                      // trim new subject code for lecture
                      // $newLecture = trim($newData['subject_code'], '-L');
                      $newLecture = str_replace("-L","", $request['subject_code']);
                      // Query for search
                      $result = Subject::where('subject_code', $search)
                      ->update([
                        'subject_code' => $newLecture,
                        'subject_title' => $newData['subject_title'],
                        'subject_description' => $newData['subject_description'],
                      ]);

                      // $newLecture = trim($newData['subject_code'], '-L');
                      $newLab = str_replace("-L","", $newData['subject_code']);

                      $newData['subject_code'] = $newLab . "-L";
                      // update the current lab
                      $subject->update($newData);

                      return response()->json(["message" => "Subject record successfully updated."], 200);

                    }
                  }else{
                    if($subject->subject_code == $request['subject_code']){

                      // find the lecture of the lab subject
                      // $search = trim($subject->subject_code, "-L");
                      $search = $subject->subject_code . "-L";
                      // Query for search
                      $result = Subject::where('subject_code', $search)
                      ->update([
                        'subject_title' => $newData['subject_title'],
                        'subject_description' => $newData['subject_description'],
                      ]);

                      // update the current lab
                      $subject->update($newData);

                      return response()->json(["message" => "Subject record successfully updated."], 200);


                    }else{
                      // find the lecture of the lab subject
                      // $search = trim($subject->subject_code, "-L");
                      $search = $subject->subject_code . "-L";
                      // trim new subject code for lecture
                      // $newLab = trim($newData['subject_code'], '-L');
                      $newLab = $newData['subject_code'] . "-L";
                      // Query for search
                      $result = Subject::where('subject_code', $search)
                      ->update([
                        'subject_code' => $newLab,
                        'subject_title' => $newData['subject_title'],
                        'subject_description' => $newData['subject_description'],
                      ]);

                      // $newLecture = trim($newData['subject_code'], '-L');
                      $newLecture = str_replace("-L","", $newData['subject_code']);

                      $newData['subject_code'] = $newLecture;
                      // update the current lab
                      $subject->update($newData);

                      return response()->json(["message" => "Subject record successfully updated."], 200);

                    }
                  }
                  //record in activity log
                  $activityLog = ActivityLog::create([
                      'user_id' => $user->id,
                      'activity' => 'Update the details of ' . $subject->subject_description . '.',
                      'time' => Carbon::now()
                  ]);
                }
                catch (QueryException $a) {
                  //record in activity log
                  $activityLog = ActivityLog::create([
                      'user_id' => $user->id,
                      'activity' => 'Attempted to delete the subject ' . $subject->subject_description . '.',
                      'time' => Carbon::now()
                  ]);
                  return response()->json([
                    'message' => 'Duplicate Entry. Please add -L on the end of subject code if subject has a laboratory units.'
                  ],400); //401: Unauthorized
                }

                catch (Exception $e) {
                    report($e);
                    return false;
                }
            }
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to update the details of ' . $subject->subject_description . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to update subject records.'
            ],401); // 401: Unauthorized
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Subject  $subject
     * @return \Illuminate\Http\Response
     */
    public function destroy(Subject $subject)
    {
        $user = Auth::user();
        //Check if user has a privilege to delete records
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.subject_management'), 'delete_priv');
        if($isAuthorized){
          try{
            $subject->delete();
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Deleted the subject ' . $subject->subject_description . '.',
                'time' => Carbon::now()
            ]);
            return response()->json(["message" => "Subject record successfully deleted."], 200);
          }
          // Delete exception
          catch (QueryException $a) {
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to delete the subject ' . $subject->subject_description . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
              'message' => 'This record is cannot be deleted because, it is already used by the system.'
            ],400); //401: Unauthorized
          }
          //
          catch (Exception $e) {
            report($e);
            return false;
          }
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to delete the subject ' . $subject->subject_description . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to delete subject records.'
            ],401); // 401: Unauthorized
        }
    }

    public function showSubjectCurriculums(Subject $subject){
        $user = Auth::user();
        //Check if user has a privilege to read records
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.subject_management'), 'read_priv');
        if ($isAuthorized) {
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Viewed the subject curriculums.',
                'time' => Carbon::now()
            ]);
            return $subject->curriculum;
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to view the subject curriculums.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view the subject curriculums.'
            ],401); // 401: Unauthorized
        }

    }
}
