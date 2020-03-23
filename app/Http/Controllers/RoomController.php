<?php

namespace App\Http\Controllers;

use App\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class RoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $user = Auth::user();
      //Check if user has permission to view room records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.room_management'), 'read_priv');
      if ($isAuthorized) {
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the list of rooms.',
            'time' => Carbon::now()
        ]);
        $rooms = Room::orderBy('id', 'DESC')->get();
        return $rooms;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the list of rooms.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view room records.'
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
      // check if user have the priviledge to create room record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.room_management'), 'create_priv');
      if ($isAuthorized) {
        //data validation
        $validator = Validator::make($request->all(),[
          'room_number' => 'required|unique:rooms,room_number',
          'room_name' => 'required|string',
          'room_type' => 'required|string',
          'room_capacity' => 'required|numeric',
          'active' => 'required|numeric',
        ]);
        // check if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new room record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $room_data = $request->all();
          $room_data['last_updated_by'] = Auth::user()->id;
          try {
            $room = Room::create($room_data);
            // check if record is successfully created.
            if ($room) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Created a new room.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'New room record successfully created.'], 200);
            }else {
              return response()->json(['message' => 'Failed to create new room record.'], 500); // server error
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
              'activity' => 'Attempted to create a new room.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to create room records.'
          ],401);     //401: Unauthorized
      }
    } // end of function store()

    /**
     * Display the specified resource.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function show(Room $room)
    {
      $user = Auth::user();
      //Check if user has permission to view room records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.room_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the details of ' . $room->room_number . '.',
            'time' => Carbon::now()
        ]);
        // original
        // $room = Room::select('*')->where('id', $room->id)->with('class_schedules')->get();
        // edited
        $room = Room::select('*')
        ->where('id', $room->id)
        ->with('class_schedules')
        ->get();
        return $room;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the details of ' . $room->room_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view room records.'
          ],401);      //401: Unauthorized
      }

    } // end of function show()

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Room $room)
    {

      $user = Auth::user();
      // check if user have the priviledge to update room record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.room_management'), 'update_priv');

      if($isAuthorized){

        //data validation
        if($room->room_number == $request['room_number']) {
          $room_data = $request->except('room_number');
        } else {
          $room_data = $request->all();
        }

        $validator = Validator::make($room_data,[
          'room_number' => 'unique:rooms,room_number',
          'room_name' => 'string',
          'room_type' => 'string',
          'room_capacity' => 'numeric',
          'active' => 'numeric',
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update room record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $room_data = $request->all();
          $room_data['last_updated_by'] = Auth::user()->id;
          try {
             $check = $room->update($room_data);
            // check if record is successfully updated.
            if ($check) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Updated the room ' . $room->room_number . '.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'Room record successfully updated.'], 200);
            }else {
              return response()->json(['message' => 'Failed to update room record.'], 500); // server error
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
              'activity' => 'Attempted to update the details of ' . $room->room_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to update room records.'
          ],401);      //401: Unauthorized
      }

    } // end of function update()

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function destroy(Room $room)
    {
      $user = Auth::user();
      //  check if user has the priviledge to delete room record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.room_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $room->delete();
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Deleted the room ' . $room->room_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json(['message' => 'Room record successfully deleted.'], 200);
        } catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to delete the room ' . $room->room_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete room records.'
          ],401);      //401: Unauthorized
      }

    } // end of function destroy()

    public function getRoomSchedules(Room $room, Request $request){
      if($request->query() != null){


        $request->merge(['time_start' => date("H:i:s", strtotime($request->query('time_start')))]);

        // return specific room schedules based on the given values
        return $room->class_schedules()->where($request->query())->get();
      }else{
        // return all schedules of specific room
        return $room->class_schedules;
      }
    }

    public function room_schedules($room, $academic_year, $semester)
    {
      $user = Auth::user();
      //Check if user has permission to view room records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.room_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the class schedule of ' . $room->room_number . '.',
            'time' => Carbon::now()
        ]);
        return $this->getClassSchedule($room, $academic_year, $semester);
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the class schedules of ' . $room->room_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view room records.'
          ],401);      //401: Unauthorized
      }
    } // end of function show()

    public function getClassSchedule($room, $academic_year, $semester){
      $classes = ClassSchedule::
          where('room_id', $room)
          ->where('academic_year_id', $academic_year)
          ->where('semester_id', $semester)
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
