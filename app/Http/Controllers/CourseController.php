<?php

namespace App\Http\Controllers;

use App\Course;
use App\Curriculum;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $user = Auth::user();
      //Check if user has permission to view course records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'read_priv');
      if ($isAuthorized) {
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the list of courses.',
            'time' => Carbon::now()
        ]);
         $courses = Course::orderBy('id', 'DESC')->with('curriculum')->get();
         $foo = [];

         foreach ($courses as $course) {
          array_push($foo,
            (object)[
                'id' => $course->id,
                'course_code' => $course->course_code,
                'course_desc' => $course->course_desc,
                'course_major' => $course->course_major,
                'year_duration' => $course->year_duration,
               'number_of_years' => $course->year_duration . " years",
               'active' => $course->active,
               'created_at' => $course->created_at,
               'updated_at' => $course->updated_at,
               'last_updated_by' => $course->last_updated_by,
               'curriculum' => $course->curriculum
             ]
          		  );
            }
         return $foo;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the list of courses.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view course records.'
          ],401); // 401: Unauthorized
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
        //check if user have the priviledge to create course record.
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'create_priv');
        if ($isAuthorized) {
          //data validation
          $validator = Validator::make($request->all(),[
            'course_code' => 'required|unique:courses,course_code',
            'course_desc' => 'required|string',
            'course_major' => 'nullable|string',
            'year_duration' => 'required|numeric',
            'active' => 'required|numeric',
          ]);

          // check if data if validator fails
          if ($validator->fails()) {
            return response()
            ->json([
              'message' => 'Failed to create new course record.',
              'errors' => $validator->errors()
            ], 400); // 400: Bad request
          }
          else {
            $course_data = $request->all();
            $course_data['last_updated_by'] = Auth::user()->id;
            try {
              $course = Course::create($course_data);
              // check if record is successfully created.
              if ($course) {
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => $user->id,
                    'activity' => 'Created a new course.',
                    'time' => Carbon::now()
                ]);
                return response()->json(['message' => 'New course record successfully created.'], 200);
              }else {
                return response()->json(['message' => 'Failed to create new course record.'], 500); // server error
              }
            } catch (Exception $e) {
              report($e);
              return false;
            }
          }
        } else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to create a new course.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to create course records.'
            ],401); //401: Unauthorized
        }

    } // end of function store()

    /**
     * Display the specified resource.
     *
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function show(Course $course)
    {
      $user = Auth::user();
      //Check if user has permission to view instructors
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the details of ' . $course->course_desc . '.',
            'time' => Carbon::now()
        ]);
        // display specific course.
        // return $course;
        $course = Course::select('*')->where('id', $course->id)->with('curriculum')->get();
        return $course;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the details of ' . $course->course_desc . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view course records.'
          ],401); //401: Unauthorized
      }

    } // end of function show()

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Course $course)
    {
      $user = Auth::user();
      //check if user have the priviledge to update course record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'update_priv');
      if($isAuthorized){

        if($course->course_code == $request['course_code']) {
          $course_data = $request->except('course_code');
        } else {
          $course_data = $request->all();
        }

        //data validation
        $validator = Validator::make($course_data,[
          'course_code' => 'unique:courses,course_code',
          'course_desc' => 'string',
          'course_major' => 'nullable|string',
          'year_duration' => 'string',
          'active' => 'numeric',
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update course record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $course_data = $request->all();
          $course_data['last_updated_by'] = Auth::user()->id;
          try {
             $check = $course->update($course_data);

            // check if record is successfully updated.
            if ($check) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Updated the course ' . $course->course_desc . '.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'Course record successfully updated.'], 200);
            }else {
              return response()->json(['message' => 'Failed to update course record.'], 500); // server error
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
              'activity' => 'Attempted to update the details of ' . $course->course_desc . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to update course records.'
          ],401); //401: Unauthorized
      }
    } // end of function update()

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Course  $course
     * @return \Illuminate\Http\Response
     */
    public function destroy(Course $course)
    {
      $user = Auth::user();
      //check if user has the priviledge to delete course record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $course->delete();
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Deleted the course ' . $course->course_desc . '.',
              'time' => Carbon::now()
          ]);
          return response()->json(['message' => 'Course record successfully deleted.'], 200);
        } catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to delete the course ' . $course->course_desc . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete course records.'
          ],401); //401: Unauthorized
      }

    } // end of function destroy()

    public function showCourseCurriculum(Course $course){
      $user = Auth::user();
      //Check if user has permission to view instructors
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the curriculums of ' . $course->course_desc . '.',
            'time' => Carbon::now()
        ]);
        // display curriculums of specified course.
        // return $course;
        return $course->curriculum;

      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the curriculums of ' . $course->course_desc . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view course curriculum records.'
          ],401); //401: Unauthorized
      }

    }
}
