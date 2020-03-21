<?php

namespace App\Http\Controllers;

use App\User;
use App\ResetPassword;
use App\Mail\ResetPasswordMailable;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class ResetPasswordController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      if($request->query() != null){
        // gets reset password record using given params
        $check = ResetPassword::where($request->query())
          ->get();
          return $check;
      }else{
        // gets ALL reset password records
        $check = ResetPassword::all();
        return $check;
      }
    }

    public function verifyEmail(Request $request){
      $reset_data = [];

      // check if there already a token request
      $check = ResetPassword::where($request->query())
        ->where('active', 1)
        ->get();

        //return a message that the user is already request a token.
        if (count($check) > 0) {
          return response()->json(['message' => 'You have already sent a request. Kindly wait for the TOKEN that will be sent to your email.'], 200);
        }else{
          // get user using email
          $user = User::where($request->query())->take(1)->get();
          if(count($user) > 0){

            $reset_data['user_id'] = $user[0]->id;
            $reset_data['email'] = $user[0]->email;
            // generates a token
            $token = str_random(32);
            $reset_data['token'] = $token;
            $reset_data['active'] = 1;

            // store user and token to reset password table
            ResetPassword::create($reset_data);

            // sent token to the email of the user
            Mail::to($user[0]->email)->send(new ResetPasswordMailable($token));
            return response()->json(['message' => 'Your request has been sent. Kindly wait for the TOKEN that will be sent to your email.'], 200);
          }else{
            return response()->json(['message' => 'Email does not exist.'],400);
          }
        }
    }

    // this will validate the token of the user
    public function validateToken(Request $request){
      $reset = ResetPassword::where($request->query())
        ->where('active', 1)
        ->get();
      if (count($reset) > 0) {
        return $reset;
      }else{
        return response()->json(['message' => 'The token that you have entered was invalid.'], 400);
      }
    }

    public function changePassword(Request $request){
        ResetPassword::where('id', $request->reset)
              ->update(['active' => 0]);

        $request->password = Hash::make($request->password);
        $user = User::where('id', $request->id)
                ->update(['password' => $request->password]);
        return $user;
    }


    //record in activity log
    // $activityLog = ActivityLog::create([
    //     'user_id' => $user->id,
    //     'activity' => 'Viewed the list of subjects.',
    //     'time' => Carbon::now()
    // ]);

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
     * @param  \App\ResetPassword  $resetPassword
     * @return \Illuminate\Http\Response
     */
    public function show(ResetPassword $resetPassword)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ResetPassword  $resetPassword
     * @return \Illuminate\Http\Response
     */
    public function edit(ResetPassword $resetPassword)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ResetPassword  $resetPassword
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ResetPassword $resetPassword)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\ResetPassword  $resetPassword
     * @return \Illuminate\Http\Response
     */
    public function destroy(ResetPassword $resetPassword)
    {
        //
    }
}
