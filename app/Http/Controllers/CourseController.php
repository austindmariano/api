<?php

namespace App\Http\Controllers;

use App\Course;
use App\Curriculum;
use App\ClassSchedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Database\QueryException;

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
          'course_desc' => 'required|string',
          'course_major' => 'nullable|string',
          'year_duration' => 'required|numeric',
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

    // try {
    //     // Your query here
    // } catch (\Illuminate\Database\QueryException $e) {
    //     // You need to handle the error here.
    //     // Either send the user back to the screen or redirect them somewhere else
    //
    //     // Just some example
    //     dd($e->getMessage(), $e->errorInfo);
    // } catch (\Exception $e) {
    //     dd($e->getMessage(), $e->errorInfo);
    // }

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
        }
          // Delete exception
        catch (QueryException $a) {
          //record in activity log
          $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to delete the course ' . $course->course_desc . '.',
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

    public function getCourseSchedules(Course $course, Request $request){
      if($request->query() != null){
        // return specific course schedules based on the given values
        return $course->class_schedules()->where($request->query())->get();
      }else{
        // return all schedules of specific room
        return $course->class_schedules;
      }
    }

    public function course_schedules($course, $academic_year, $semester, $year_level, $block, $batch = null){
      $user = Auth::user();
      //Check if user has permission to view course records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.course_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the class schedule of ' . $course->course_code . '.',
            'time' => Carbon::now()
        ]);
        return $this->getClassSchedule($course, $academic_year, $semester, $year_level, $block, $batch);
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the class schedules of ' . $course->course_code . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view course records.'
          ],401);      //401: Unauthorized
      }
    } // end of function course_schedules

    public function getClassSchedule($course, $academic_year, $semester, $year_level, $block, $batch){
      $classes = ClassSchedule::
          where('course_id', $course)
          ->where('academic_year_id', $academic_year)
          ->where('semester_id', $semester)
          ->where('year_level', $year_level)
          ->where('block', $block)
          ->orderBy('id', 'DESC')->get();
      $myArr = [];
      $i = 0;
      foreach ($classes as $class) {
        $sched_time_start  = date("g:iA", strtotime($class->time_start));
        $sched_time_end  = date("g:iA", strtotime($class->time_end));
        $myArr[$i] = array(
          'id' => $class->id,
          'subject' => array(
            'curr_subject_id' => $class->subject->id,
            'subject_id' => $class->subject->subject_id,
            'subject_code' => $class->subject->subject->subject_code,
            'subject_desc' => $class->subject->subject->subject_description,
            'year_level' => $class->subject->year_level,
            'units' => $class->subject->subject->units,
            'lec' => $class->subject->subject->lec,
            'lab' => $class->subject->subject->lab,
            'active' => $class->subject->subject->active,
          ),
          'curriculum' => array(
            'curriculum_id' => $class->subject->curriculum->id,
            'curriculum_title' => $class->subject->curriculum->curriculum_title,
            'curriculum_desc' => $class->subject->curriculum->curriculum_desc,
          ),
          'course' => array(
            'id' => $class->subject->curriculum->course->id,
            'course_code' => $class->subject->curriculum->course->course_code,
            'course_desc' => $class->subject->curriculum->course->course_desc,
            'course_major' => $class->subject->curriculum->course->course_major
          ),
         'room' => array(
            'id' => $class->room->id,
            'room_number' => $class->room->room_number,
            'room_name' => $class->room->room_name,
            'room_capacity' => $class->room->room_capacity,
          ),
         'instructor' => array(
            'id' => $class->instructor->id,
            'first_name' => $class->instructor->first_name,
            'middle_name' => $class->instructor->middle_name,
            'last_name' => $class->instructor->last_name,
            'full_name' => $class->instructor->first_name . " " . $class->instructor->last_name
          ),
          'schedule' => array(
            'day' => $class->day,
            'time_start' => $sched_time_start,
            'time_end' => $sched_time_end,
            'time' => $sched_time_start . "-" . $sched_time_end
          ),
          'sem' => array(
            'id' => $class->semester->id,
            'semester' => $class->semester->semester,
          ),
          'ay' => array(
            'id' => $class->academic_year->id,
            'academic_year' => $class->academic_year->academic_year,
            'formatted_ay' => "SY " . $class->academic_year->academic_year
          ),
          'block' => $class->block,
          'batch' => $class->batch,
        );
        $i++;
      }
      return $myArr;
    } // end of function getClassSchedule
}
