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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //data validation
        // $validator = Validator::make($request->all(),[
        //   'first_name' => 'required|string',
        //   'middle_name' => 'nullable|string',
        //   'last_name' => 'required|string',
        //   'suffix_name' => 'nullable|string',
        //   'gender' => 'required|string',
        //   'civil_status' => 'required|string',
        //   'citizenship' => 'required|string',
        //   'address' => 'required|string',
        //   'barangay' => 'required|string',
        //   'city' => 'required|string',
        //   'province' => 'required|string',
        //   'postal' => 'required|numeric',
        //   'telephone' => 'nullable|string',
        //   'cellphone' => 'nullable|numeric',
        //   'email' => 'nullable|string',
        //   'birth_date' => 'required',
        //   'birth_place' => 'required|string',
        //   'father_name' => 'nullable|string',
        //   'mother_name' => 'nullable|string',
        //   'contact_person' => 'required|string',
        //   'contact_address' => 'required|string',
        //   'contact_number' => 'required|numeric',
        //   'blood_type' => 'nullable|string',
        //   'user_id' => 'nullable|string',
        //   'active' => 'required|numeric',
        //   'student_status' => 'nullable|numeric',
        //   'school_last_attended' => 'required|string',
        //   'school_address' => 'required|string',
        //   'college_last_attended' => 'nullable|string',
        //   'college_address' => 'nullable|string',
        //   'last_track' => 'nullable|numeric',
        //   'last_strand' => 'nullable|numeric',
        //   'last_course' => 'nullable|numeric',
        // ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new student record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {

        }
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
