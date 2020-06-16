<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\ActivityLog;
use App\User;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;
    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * Log users in if they have valid credentials
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function login(Request $request){
        if(Auth::attempt(['username' => $request->username, 'password' => $request->password])){
            $user = Auth::user();
            // check if user account is active
            if ($user->active == 1){
              //check if user account is blocked
              if ($user->blocked == 1){
                return response()->json([
                  "message" => "Your account is currently blocked",
                  "user_info" => $user
                ], 403);    //invalid credentials: unauthorized
              }else{
                User::where('username', $request->username)->update(['attempts' => 0]);
                $user['activities'] = $user->privileges;
                //record in activity log
                $activityLog = ActivityLog::create([
                    'user_id' => $user->id,
                    'activity' => 'Logged in to the system.',
                    'time' => Carbon::now()
                ]);
                return response()->json([
                    "message" => "successfully logged in.",
                    "user" => $user,
                    "token" => $user->createToken('Comteq Registration System')->accessToken
                ], 200);    //user is now logged in
              }
            }else{
              return response()->json([
                "message" => "Your account is currently inactive",
                "user_info" => $user
              ], 403);    //invalid credentials: unauthorized
            }

        }else{
          // check if user account exists
          $user = User::where('username', $request->username)->get();
          if(count($user) > 0){
            $acc = $user[0];
            if ($acc->active == 1){
              // check if user is blocked
              if ($acc->blocked == 1){
                return response()->json([
                  "message" => "Your account is currently blocked. Please contact your System Administrator.",
                  "user_info" => $acc
                ], 403);    //invalid credentials: unauthorized
              }
              else{
                  User::where('username', $request->username)->increment('attempts', 1);
                  $acc->attempts = $acc->attempts + 1 ;
                // if not blocked check user attempts
                if ($acc->attempts < 3){
                  $remaining = 3 - $acc->attempts ;
                  return response()->json([
                    "message" => "Invalid username or password. You have " . $remaining . " more attempts remaining and your account will be blocked.",
                    "user_info" => $acc
                  ], 400);    //invalid credentials: Unauthorized
                }
                elseif($acc->attempts == 3){
                  User::where('username', $request->username)->increment('blocked', 1);
                  return response()->json([
                    "message" => "Maximum attempts reached, your account has been blocked. Please contact your System Administrator.",
                    "user_info" => $acc
                  ], 403);    //invalid credentials: unauthorized
                }
              }
            }else{
              return response()->json([
                "message" => "Your account is currently inactive",
                "user_info" => $acc
              ], 403);    //invalid credentials: unauthorized
            }

          }else{
            return response()->json([
              "message" => "Account doesn't exists."
            ], 400);    //invalid credentials: bad request
          }
          // $user = User::where('username', $request->username)->increment('attempts', 1);
          // $user->update($userData);
        }
    }


    public function logout(){
        $user = Auth::user();
        if($user) {
            $user->token()->revoke();
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Logged out of the system.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                "message" => "successfully logged out."
            ], 200);    //user is now logged out
        }else{
            return response()->json([
                "message" => "Unauthorized"
            ], 401);    //invalid credentials: unauthorized
        }
    }
}
