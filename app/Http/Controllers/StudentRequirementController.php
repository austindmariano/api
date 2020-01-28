<?php

namespace App\Http\Controllers;

use App\Student;
use App\StudentRequirement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;


use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class StudentRequirementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $user = Auth::user();
      //Check if user has permission to view student requirements records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.requirements_management'), 'read_priv');
      if ($isAuthorized) {
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the list of student requirements.',
            'time' => Carbon::now()
        ]);
         $requirements = StudentRequirement::orderBy('id', 'DESC')->get();
         return $requirements;

      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the list of student requirements.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view student requirements records.'
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
      //check if user have the priviledge to create student requirements record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.requirements_management'), 'create_priv');
      if ($isAuthorized) {
        //data validation
        $validator = Validator::make($request->all(),[
            'id' => 'nullable|numeric',
            'student_number' => 'nullable',
            'url_tor' => 'image|nullable|max:1999',
            'url_good_moral' => 'image|nullable|max:1999',
            'url_form_137' => 'image|nullable|max:1999',
            'url_form_138' => 'image|nullable|max:1999',
            'url_birth_certificate' => 'image|nullable|max:1999',
        ]);


        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new student requirement record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $requirement_data = $request->all();
          $requirement_data['last_updated_by'] = Auth::user()->id;

          // getting the latest student
          $student = Student::orderBy('id', 'DESC')->first();
          $requirement_data['student_number'] = $student->student_number;
          $requirement_data['id'] = $student->id;

          // setting url to no images temporarily
          $requirement_data['url_tor'] = 'no_image.jpg';
          $requirement_data['url_good_moral'] = 'no_image.jpg';
          $requirement_data['url_form_137'] = 'no_image.jpg';
          $requirement_data['url_form_138'] = 'no_image.jpg';
          $requirement_data['url_birth_certificate'] = 'no_image.jpg';

          try {
            $requirements = StudentRequirement::create($requirement_data);
            // check if record is successfully created.
            if ($requirements) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Created a new student requirement.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'New student requirement successfully created.'], 200);
            }else {
              return response()->json(['message' => 'Failed to create new student requirement record.'], 500); // server error
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
              'activity' => 'Attempted to create a new student requirement.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to create student requirement records.'
          ],401); //401: Unauthorized
      }
    } // end of function store()

    /**
     * Display the specified resource.
     *
     * @param  \App\StudentRequirement  $studentRequirement
     * @return \Illuminate\Http\Response
     */
    public function show(StudentRequirement $studentRequirement)
    {
      $user = Auth::user();
      //Check if user has permission to view instructors
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.requirements_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the details of ' . $studentRequirement->student_number . '.',
            'time' => Carbon::now()
        ]);
        // display specific student requirements.
        return $studentRequirement;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the details of ' . $studentRequirement->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view student requirements records.'
          ],401); //401: Unauthorized
      }
    } // end of function show()

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\StudentRequirement  $studentRequirement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StudentRequirement $studentRequirement)
    {
      $user = Auth::user();
      //check if user have the priviledge to update course record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.requirements_management'), 'update_priv');
      if($isAuthorized){
        //data validation
        $validator = Validator::make($request->all(),[
          'student_number' => 'nullable|numeric',
          'url_tor' => 'image|nullable|max:1999',
          'url_good_moral' => 'image|nullable|max:1999',
          'url_form_137' => 'image|nullable|max:1999',
          'url_form_138' => 'image|nullable|max:1999',
          'url_birth_certificate' => 'image|nullable|max:1999',
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update student requirement record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          // $requirement_data = $request->all();
          $requirement_data['last_updated_by'] = Auth::user()->id;

          for ($i=0; $i <= 4; $i++) {
            if($i == 0) {
              if($request->hasFile('url_tor')){
                $extension = $request->file('url_tor')->getClientOriginalExtension();
                $requirement_data['url_tor'] = $studentRequirement->student_number . "_tor." . $extension;
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_tor'] = 'no_image.jpg';
              }
            }
            elseif($i == 1) {
              if($request->hasFile('url_good_moral')){
                $extension = $request->file('url_good_moral')->getClientOriginalExtension();
                $requirement_data['url_good_moral'] = $studentRequirement->student_number . "_good_moral." . $extension;
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_good_moral'] = 'no_image.jpg';
              }
            }
            elseif($i == 2) {
              if($request->hasFile('url_form_137')){
                $extension = $request->file('url_form_137')->getClientOriginalExtension();
                $requirement_data['url_form_137'] = $studentRequirement->student_number . "_form_137." . $extension;
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_form_137'] = 'no_image.jpg';
              }
            }
            elseif($i == 3 ){
              if($request->hasFile('url_form_138')){
                $extension = $request->file('url_form_138')->getClientOriginalExtension();
                $requirement_data['url_form_138'] = $studentRequirement->student_number . "_form_138." . $extension;
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_form_138'] = 'no_image.jpg';
              }
            }
            elseif($i == 4 ){
              if($request->hasFile('url_birth_certificate')){
                $extension = $request->file('url_birth_certificate')->getClientOriginalExtension();
                $requirement_data['url_birth_certificate'] = $studentRequirement->student_number . "_birth_certificate." . $extension;
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_birth_certificate'] = 'no_image.jpg';
              }
            }
          }
          try {
             $check = $studentRequirement->update($requirement_data);
            // check if record is successfully updated.
            if ($check) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Updated the requirement record of student ' . $studentRequirement->student_number . '.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'Student requirement record successfully updated.'], 200);
            }else {
              return response()->json(['message' => 'Failed to update student requirement record.'], 500); // server error
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
              'activity' => 'Attempted to update the requirement record of student ' . $studentRequirement->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to update student requirement records.'
          ],401); //401: Unauthorized
      }
    } // end of function update()

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\StudentRequirement  $studentRequirement
     * @return \Illuminate\Http\Response
     */
    public function destroy(StudentRequirement $studentRequirement)
    {
      $user = Auth::user();
      //check if user has the priviledge to delete requirement record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.requirements_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $studentRequirement->delete();
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Deleted the requirement record of student ' . $studentRequirement->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json(['message' => 'Student requirement record successfully deleted.'], 200);
        } catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to delete the requirement record of student ' . $studentRequirement->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete student requirements records.'
          ],401); //401: Unauthorized
      }
    } // end of function destroy()
}
