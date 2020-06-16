<?php

namespace App\Http\Controllers;

use App\User;
use App\ActivityLog;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Database\QueryException;

class UserController extends Controller
{
    public function index(Request $request){
        $user = Auth::user();
        //Check if user has permission to view user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.user_management'), 'read_priv');

        if($isAuthorized){
            if($request->query() != null){
                if($request->query('sort')!=null){
                    $users = User::orderBy($request->query('sort'))->get();
                }else{
                    $users = User::where($request->query())->get();
                }
            }else{
                $users = User::orderBy('id', 'DESC')->get();
            }

            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Viewed list of user accounts.',
                'time' => Carbon::now()
            ]);
            return $users;
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to view list of user accounts.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view user accounts.'
            ],401);
        }

    }

    public function show(User $user){

        //Check if user has permission to view user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'read_priv');

        if($isAuthorized){
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Viewed user account of ' . $user->username . '.',
                'time' => Carbon::now()
            ]);
            return $user;
        }
        else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to View user account of ' . $user->username . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view user accounts.'
            ],401);
        }
    }

    public function update(Request $request, User $user){
        //Check if user has permission to update user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'update_priv');

        if($isAuthorized){
          $validator = Validator::make($request->all(),[
              'username' => 'string',
              'email' => 'email',
              // 'password' => 'min:6|confirmed',
              'first_name' => 'string',
              'middle_name' => 'nullable|string',
              'last_name' => 'string',
              'role' => 'string'
          ]);

          if ($validator->fails()){
              return response()->json([
                  'message' => 'Failed to update user account.',
                  'errors' => $validator->errors()
              ],400);    //Bad request
          }
          else{

            // check if username already exist
            $email = User::select('*')
              ->where('id', '!=', $user->id)
              ->where('email', $request->email)
              ->get();

            // check if email is already used
            $username = User::select('*')
              ->where('id', '!=', $user->id)
              ->where('username', $request->username)
              ->get();

            // check if there is alredy a record
            $error = [];
            if (count($email) > 0 || count($username) > 0) {
              if (count($email) > 0) {
                $error['email'] = [];
                array_push(  $error['email'], "This email is already used.");
              }
              if (count($username) > 0) {
                $error['username'] = [];
                array_push(  $error['username'], "This username is already used.");
              }
                return response()->json([
                  'message' => 'Failed to update user account.',
                  'errors' => $error
                ],400);    //Bad request
            }
            else {
              $userData = $request->all();
              // $userData['password'] = Hash::make($request->password);
              $userData['last_updated_by'] = Auth::user()->id;
              $user->update($userData);

              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => Auth::user()->id,
                  'activity' => 'Updated user account of ' . $user->username . '.',
                  'time' => Carbon::now()
              ]);

              return response()->json([
                  'message' => 'User account successfully updated.'
              ], 200);
            }
          }


            // $validator = Validator::make($request->all(),[
            //     'username' => 'string|unique:users',
            //     'email' => 'email|unique:users',
            //     'first_name' => 'string',
            //     'middle_name' => 'string',
            //     'last_name' => 'string',
            //     'role' => 'string'
            // ]);


            //if validation fails



        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to update user account of ' . $user->username . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to update user accounts.'
            ],401);
        }

    }

    public function destroy(User $user){
        //Check if user has permission to delete user accounts
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'delete_priv');

        if($isAuthorized){
          try{
            $user->delete();
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Deleted user account of ' . $user->username . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'User account successfully deleted.'
            ], 200);
          }
          // Delete exception
          catch (QueryException $a) {
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to delete user account of ' . $user->username . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
              'message' => 'This record is cannot be deleted because, it is already used by the system.'
            ],400); //401: Unauthorized
          }
          catch (Exception $e) {
            report($e);
            return false;
          }
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => Auth::user()->id,
                'activity' => 'Attempted to delete user account of ' . $user->username . '.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to delete user accounts.'
            ],401);
        }

    }

    public function updateUserPrivilege(UserPrivilege $userprivilege, Request $request){
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

    public function showUserPrivilege(User $user){
      //Check if user has permission to view user accounts
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges(Auth::user()->id, Config::get('settings.user_management'), 'read_priv');

      if($isAuthorized){
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Viewed user account of ' . $user->username . '.',
              'time' => Carbon::now()
          ]);
          return $user->privileges;
      }
      else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Attempted to View user account of ' . $user->username . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view user accounts.'
          ],401);
      }
    }

    // change password function
    public function changePassword(Request $request, User $user){
      $validator = Validator::make($request->all(),[
          'password' => 'required|min:6',
      ]);

      if ($validator->fails()){
          return response()->json([
              'message' => 'Failed to change password.',
              'errors' => $validator->errors()
          ],400);    //Bad request
      }
      else{
        $userData = $request->all();
        // $userData['password'] = Hash::make($request->password);
        $userData['last_updated_by'] = Auth::user()->id;
        $userData['password'] = Hash::make($userData['password']);

        $user->update($userData);

        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => Auth::user()->id,
            'activity' => 'Updated password of ' . $user->username . '.',
            'time' => Carbon::now()
        ]);

        return response()->json([
            'message' => 'Password successfully updated.'
        ], 200);
      }
    } // end of change password function

    public function updateProfile(Request $request, User $user){

      if($user->username == $request['username'] && $user->email == $request['email']) {
        $userData = $request->except(['username', 'email']);

      } elseif ($user->username == $request['username']) {
        $userData = $request->except('username');

      } elseif ($user->email == $request['email']) {
        $userData = $request->except('email');

      } else {
        $userData = $request->all();
      }

      // if($user->email == $request['email']) {
      //   $userData = $request->except('email');
      // } else {
      //   $userData = $request->all();
      // }

      $validator = Validator::make($userData,[
        'username' => 'unique:users',
        'email' => 'email|unique:users',
        'first_name' => 'required|string',
        'middle_name' => 'nullable|string',
        'last_name' => 'required|string',
      ]);

      if ($validator->fails()){
          return response()->json([
              'message' => 'Failed to update user profile.',
              'errors' => $validator->errors()
          ],400);    //Bad request
      }
      else{
        $userData = $request->all();
        // $userData['password'] = Hash::make($request->password);
        $userData['last_updated_by'] = Auth::user()->id;
        $user->update($userData);

        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => Auth::user()->id,
            'activity' => 'Updated user profile of ' . $user->username . '.',
            'time' => Carbon::now()
        ]);

        $user['activities'] = $user->privileges;

        return response()->json([
            'message' => 'User profile successfully updated.',
            'user' => $user
        ], 200);
      }
    } // end of change password function


}
