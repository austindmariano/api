<?php

namespace App\Http\Controllers;

use App\ActivityLog;
use App\UserPrivilege;
use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;


class UserPrivilegeController extends Controller
{
    public function grantPrivilege(Request $request){
        //Check if user has permission to manage user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'create_priv');

        if ($isAuthorized) {
            // $request['last_updated_by'] = Auth::user()->id;

            $user_privileges = $request->except('last_updated_by');
            foreach ($user_privileges as $user_privilege) {
              $user_privilege['last_updated_by'] = Auth::user()->id;
              $privilege = UserPrivilege::create($user_privilege);
            }
            // $privilege = UserPrivilege::create($request->all());

            if($privilege != null){
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => Auth::user()->id,
                    'activity' => 'Granted some privileges to user ' . $request[0]['user_id'] . '.',
                    'time' => Carbon::now()
                ]);
                return response()->json([
                    'message' => 'Privileges successfully granted to user.'
                ]);
            }
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to grant some privileges to user ' . $request[0]['user_id'] . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to grant privileges to user.'
            ], 401);
        }

    }

    public function updatePrivilege(Request $request, UserPrivilege $userprivilege){
        //Check if user has permission to manage user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'update_priv');
        if ($isAuthorized) {
            $request['last_updated_by'] = Auth::user()->id;
            $userprivilege->update($request->all());
            if($userprivilege != null){
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => Auth::user()->id,
                    'activity' => 'Updated the privileges of user ' . $request['user_id'] . '.',
                    'time' => Carbon::now()
                ]);
                return response()->json([
                    'message' => 'Privileges successfully updated.'
                ]);
            }
        }else{
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to pdate the privileges of user ' . $request['user_id'] . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to update privileges.'
            ], 401);
        }

    }

    public function showUserPrivilege(User $user,  UserPrivilege $userprivilege){
        //Check if user has permission to manage user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'update_priv');
        if ($isAuthorized) {
            $request['last_updated_by'] = Auth::user()->id;

            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'View the privileges of user ' . $user->id . '.',
                'time' => Carbon::now()
            ]);

            return $userprivilege;
        }else{
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to view the privileges of user ' . $user->id . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view privileges.'
            ], 401);
        }

    }

    public function updateUserPrivilege(Request $request, User $user, UserPrivilege $userprivilege){
        //Check if user has permission to manage user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'update_priv');
        if ($isAuthorized) {
            $request['last_updated_by'] = Auth::user()->id;
            $userprivilege->update($request->all());
            if($userprivilege != null){
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => Auth::user()->id,
                    'activity' => 'Updated the privileges of user ' . $request['user_id'] . '.',
                    'time' => Carbon::now()
                ]);
                return response()->json([
                    'message' => 'Privileges successfully updated.'
                ]);
            }
        }else{
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to update the privileges of user ' . $request['user_id'] . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to update privileges.'
            ], 401);
        }
    }

    public function checkPrivileges($user, $activity, $privilege){
        return \DB::table('user_privileges')
            ->where('user_id', $user)
            ->where('activity_id', $activity)
            ->where($privilege, 1)
            ->exists();
    }

    public function destroy(User $user, UserPrivilege $userprivilege)
    {
      $user = Auth::user();
      //check if user has the priviledge to delete $userprivilege record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.user_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $userprivilege->delete();
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Deleted the privilege of user ' . $user->id . '.',
              'time' => Carbon::now()
          ]);
          return response()->json(['message' => 'Privilege record successfully deleted.'], 200);
        }
          // Delete exception
        catch (QueryException $a) {
          //record in activity log
          $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to delete the privilege of user ' . $user->id . '.',
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
            'activity' => 'Attempted to delete the privilege of user ' . $user->id . '.',
            'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete privilege records.'
          ],401); //401: Unauthorized
      }

    } // end of function destroy()

    public function bulkUpdatePrivilege(Request $request){
        //Check if user has permission to manage user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'update_priv');
        if ($isAuthorized) {

          // $request['last_updated_by'] = Auth::user()->id;
          $privileges = $request->all();
          foreach ($privileges as $v) {
            $result = UserPrivilege::where('id', $v['id'])
            ->update([
              'create_priv' => $v['create_priv'],
              'read_priv' => $v['read_priv'],
              'update_priv' => $v['update_priv'],
              'delete_priv' => $v['delete_priv'],
            ]);
          }

          // return $request[1]['id'];

          if ($result) {
            //record in activity log
            $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Updated the privileges of user ' . $request['user_id'] . '.',
              'time' => Carbon::now()
            ]);
            return response()->json([
              'message' => 'Privileges successfully updated.'
            ]);

          }

        }else{
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to update the privileges of user ' . $request['user_id'] . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to update privileges.'
            ], 401);
        }
    }
}
