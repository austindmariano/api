<?php

namespace App\Http\Controllers;

use App\UserActivity;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class UserActivityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $user = Auth::user();
      //Check if user has permission to view activities
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.user_management'), 'read_priv');

      if($isAuthorized){

          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Viewed the list of activities.',
              'time' => Carbon::now()
          ]);
          return UserActivity::select('*')->orderBy('id', 'DESC')->get();
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the list of activities.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view the list of user activities.'
          ],401);      //401: Unauthorized
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\UserActivity  $userActivity
     * @return \Illuminate\Http\Response
     */
    public function show(UserActivity $userActivity)
    {
        //
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\UserActivity  $userActivity
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserActivity $userActivity)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\UserActivity  $userActivity
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserActivity $userActivity)
    {
      //Check if user has permission to delete user accounts
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'delete_priv');

      if($isAuthorized){
          $userActivity->delete();
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Deleted user activity of',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'User activity successfully deleted.'
          ], 200);
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Attempted to delete user activity of',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete user activity.'
          ],401);
      }
    }
}
