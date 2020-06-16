<?php

namespace App\Http\Controllers;

use App\Setting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

use App\ActivityLog;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $setting = Setting::all();
      return $setting[0];
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Setting $setting)
    {
      $isAuthorized = Auth::user()->role;

      if($isAuthorized == "System Administrator"){
        try {
          $result = DB::table('settings')
                  ->update([
                    'current_academic_year' => $request->current_academic_year ,
                    'current_semester' => $request->current_semester]);

          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => Auth::user()->id,
              'activity' => 'Updated database settings.',
              'time' => Carbon::now()
          ]);
          // return success message


          // return Config::get('settings');

          $current = $this->index();
          // Config::set('settings')['current_ay'] = 2;
          // Config::set('settings')['current_sem'] = 1;

          $settings = Config::get('settings');
          $settings['current_ay'] = $current->current_academic_year;
          $settings['current_sem'] = $current->current_semester;

          return response()->json([
            "message" => "Settings successfully updated.",
            "settings" => $settings
          ], 200);

        } catch (Exception $e) {
          report($e);
          return false;
        }

      } else {
        return response()->json([
          "message" => "You are not authorized to update settings."
        ], 401);
      }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function destroy(Setting $setting)
    {
        //
    }
}
