<?php

namespace App\Http\Controllers;

use App\PreRegistration;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\ActivityLog;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;

class PreRegistrationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      // gets the id of the current user
      $user = Auth::user();
      //Check if user has permission to view student records.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'read_priv');
      if ($isAuthorized) {
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the list of pre registered students.',
            'time' => Carbon::now()
        ]);
         $result = PreRegistration::orderBy('id', 'DESC')->get();
         return $result;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the list of pre registered students.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view pre registered student records.'
          ],401); // 401: Unauthorized
      }
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      // $user = Auth::user();
      // check if user have the priviledge to create pre registration record.
      // $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'create_priv');
      $isAuthorized = true;
      if ($isAuthorized) {
        //data validation
        $request['registration_code'] = str_random(10);

        $validator = Validator::make($request->all(),[
          'first_name' => 'required|string',
          'middle_name' => 'nullable|string',
          'last_name' => 'required|string',
          'suffix_name' => 'nullable|string',
          'gender' => 'required|string',
          'civil_status' => 'required|string',
          'citizenship' => 'required|string',
          'address' => 'required|string',
          'barangay' => 'required|string',
          'city' => 'nullable|string',
          'province' => 'required|string',
          'postal' => 'nullable|numeric',
          'telephone' => 'nullable|string',
          'cellphone' => 'nullable|numeric',
          'email' => 'nullable|string|email',
          'birth_date' => 'required',
          'birth_place' => 'required|string',
          'father_name' => 'nullable|string',
          'mother_name' => 'nullable|string',
          'contact_person' => 'nullable|string',
          'contact_address' => 'nullable|string',
          'contact_number' => 'nullable|numeric',
          'blood_type' => 'nullable|string',
          'photo_url' => 'nullable|string',
          'user_id' => 'nullable|string',
          'active' => 'required|numeric',
          'student_status' => 'nullable|string',
          'school_last_attended' => 'required|string',
          'school_address' => 'required|string',
          'college_last_attended' => 'nullable|string',
          'college_address' => 'nullable|string',
          'last_track' => 'nullable|numeric',
          'last_strand' => 'nullable|numeric',
          'last_course' => 'nullable|numeric',
          'registration_code' => 'required'
        ]);
        // check if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new pre registration record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $preRegistration_data = $request->all();
          // $preRegistration_data['last_updated_by'] = Auth::user()->id;

          // converting of date into MySQL Date format
          $date = strtotime($request->birth_date);
          $preRegistration_data['birth_date'] = date('Y-m-d',$date);
          try {
            $preRegistration = PreRegistration::create($preRegistration_data);
            // check if record is successfully created.
            if ($preRegistration) {
              //record in activity log
              // $activityLog = ActivityLog::create([
              //     'user_id' => $user->id,
              //     'activity' => 'Created a new pre registration record.',
              //     'time' => Carbon::now()
              // ]);
              return response()->json(['message' => 'New pre registration successfully created.'], 200);
            }else {
              return response()->json(['message' => 'Failed to create new pre registration record.'], 500); // server error
            }
          } catch (Exception $e) {
            report($e);
            return false;
          }
        }
      }else{
          //record in activity log
          // $activityLog = ActivityLog::create([
          //     'user_id' => $user->id,
          //     'activity' => 'Attempted to create a pre registration.',
          //     'time' => Carbon::now()
          // ]);
          return response()->json([
              'message' => 'You are not authorized to create pre registration records.'
          ],401);     //401: Unauthorized
      }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\PreRegistration  $preRegistration
     * @return \Illuminate\Http\Response
     */
    public function show(PreRegistration $preRegistration)
    {
      return "asdfas";
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PreRegistration  $preRegistration
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PreRegistration $preRegistration)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PreRegistration  $preRegistration
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, PreRegistration $preRegistration)
    {
      $user = Auth::user();
      //check if user has the priviledge to delete student record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $check = PreRegistration::where('id', $request->query('id'))->delete();

          if ($check) {
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Deleted the pre-registration record of student.',
                'time' => Carbon::now()
            ]);
            return response()->json(['message' => 'PreRegistration record successfully deleted.'], 200);
          }else {
            return response()->json(['message' => 'Failed to delete pre-registration record.'], 500);
          }
        }catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to delete the pre-registration record of student.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete pre registered student records.'
          ],401); //401: Unauthorized
      }
    }
}
