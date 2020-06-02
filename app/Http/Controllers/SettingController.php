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
      // $check = DB::table('settings')->get();
      // $check[0]->current_academic_year = 4;
      // $check[0]->current_semester = 2;

      $affected = DB::table('settings')
              ->update(['current_academic_year' => 4 , 'current_semester' => 2]);

      // $check->save();
      return $affected;
      // DB:table('setting')->update()
      // $check = $setting->update();
      // $check = $setting->update($request->all());

      return $check;
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
