<?php

namespace App\Http\Controllers;

use App\PreRegisteredStudent;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;

class PreRegisteredStudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

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
     * @param  \App\PreRegisteredStudent  $preRegisteredStudent
     * @return \Illuminate\Http\Response
     */
    public function show(PreRegisteredStudent $preRegisteredStudent)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PreRegisteredStudent  $preRegisteredStudent
     * @return \Illuminate\Http\Response
     */
    public function edit(PreRegisteredStudent $preRegisteredStudent)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PreRegisteredStudent  $preRegisteredStudent
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PreRegisteredStudent $preRegisteredStudent)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PreRegisteredStudent  $preRegisteredStudent
     * @return \Illuminate\Http\Response
     */
    public function destroy(PreRegisteredStudent $preRegisteredStudent)
    {
        //
    }
}
