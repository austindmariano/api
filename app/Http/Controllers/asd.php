<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class UserActivitiesController extends Controller
{
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
          return UserActivity::select('*')->get();
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
  } // end of function index()
}
