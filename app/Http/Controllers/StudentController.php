<?php

namespace App\Http\Controllers;

use App\Student;
use App\StudentRequirement;
use App\AcademicYear;
use App\Semester;
use App\Course;
use Carbon\Carbon;
use App\ActivityLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // gets the id of the current user
        $user = Auth::user();
        //Check if user has permission to view student records.
        $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'read_priv');
        if ($isAuthorized) {
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Viewed the list of students.',
              'time' => Carbon::now()
          ]);
           $students = Student::orderBy('id', 'DESC')->with('enrollment')->get();
           return $students;
        }else{
            //record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Attempted to view the list of students.',
                'time' => Carbon::now()
            ]);
            return response()->json([
                'message' => 'You are not authorized to view student records.'
            ],401); // 401: Unauthorized
        }
    } // end of function index()


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      // gets the id of the current user
      $user = Auth::user();
      //check if user have the priviledge to create student record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'create_priv');
      if ($isAuthorized) {

        //data validation
        $validator = Validator::make($request->all(),[
          'first_name' => 'required|string',
          'middle_name' => 'nullable|string',
          'last_name' => 'required|string',
          'suffix_name' => 'nullable|string',
          'gender' => 'required|string',
          'civil_status' => 'required|string',
          'citizenship' => 'required|string',
          'address' => 'required|string',
          'barangay' => 'required|string',
          'city' => 'required|string',
          'province' => 'required|string',
          'postal' => 'nullable|numeric',
          'telephone' => 'nullable|string',
          'cellphone' => 'nullable|numeric',
          'email' => 'nullable|string|email',
          'birth_date' => 'required',
          'birth_place' => 'required|string',
          'father_name' => 'nullable|string',
          'mother_name' => 'nullable|string',
          'contact_person' => 'nullable|string',
          'contact_address' => 'nullable|string',
          'contact_number' => 'nullable|numeric',
          'blood_type' => 'nullable|string',
          'photo_url' => 'nullable|string',
          // nullable muna ... baguhin nalang next time
          'user_id' => 'nullable|string',
          'active' => 'required|numeric',
          'student_status' => 'nullable|string',
          'school_last_attended' => 'required|string',
          'school_address' => 'required|string',
          'college_last_attended' => 'nullable|string',
          'college_address' => 'nullable|string',
          'last_track' => 'nullable|numeric',
          'last_strand' => 'nullable|numeric',
          'last_course' => 'nullable|numeric',
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new student record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          //passing all of data
          $student_data = $request->all();

          //gets the id of the current user
          $student_data['last_updated_by'] = Auth::user()->id;

          // converting of date into MySQL Date format
          $date = strtotime($request->birth_date);
          $student_data['birth_date'] = date('Y-m-d',$date);

          // // getting of current settings from DB
          $setting = \DB::table('settings')->first();

          // =========================================
          // NOTE: Generating of Student Number

          //passing current academic year
          $acad_year = AcademicYear::find($setting->current_academic_year);

          // splitting current acad year.
          $split_ay = str_split($acad_year->academic_year);

          // getting only the **00 and **00
          $ay_number = $split_ay[2].$split_ay[3].$split_ay[7].$split_ay[8];

          //passing of current semester
          $sem = Semester::find($setting->current_semester);

          if($sem->semester == "1st Semester"){
          	$sem_number = "-01-";
          }
          elseif($sem->semester == "2nd Semester"){
          	$sem_number = "-02-";
          }
          elseif($sem->semester == "Summer"){
          	$sem_number = "-03-";
          }
          // getting the lastest entered student number
          $student = Student::select('*')
              ->orderBy('id', 'DESC')
              ->take(1)
              ->get();

          if(count($student) > 0){

            $students = Student::select('*')->get();

            function get_max_student_number($students, $value='student_number'){
                $max=0;
                foreach($students as $point){

                  $last_num = explode("-", $point->student_number);
                  $point->student_number = $last_num[2];

                    if($max < (float)$point->{$value}){
                        $max = $point->{$value};
                    }
                }
                return $max;
            }
            $max = get_max_student_number($students);


            $num = $max + 1;

            $latest_num = sprintf("%04d", $num);



            //spliting student number and pass it in an array varaiable
            // $last_num = explode("-", $student[0]->student_number);

            //increment the last digit from the student number
            // $num = $last_num[2] + 1;

            // student number increment ****-**-0000++
            // $latest_num = substr("0000{$num}", -4);
            // $latest_num = sprintf("%04d", $num);

            $student_data['student_number'] = $ay_number.$sem_number.$latest_num;

            // return $student_data['student_number'];

            // return $ay_number.$sem_number.$latest_num;
            // return $student;
          }else{
              $student_data['student_number'] = $ay_number.$sem_number. "0000";
          }


          // return $student_data['student_number'];
          try {

            $student = Student::create($student_data);
            // check if record is successfully created.
            if ($student) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Created a new student record.',
                  'time' => Carbon::now()
              ]);
              // return "ffff";
              // $this->storeStudentRequirements($request);
              return response()->json(['message' => 'New student record successfully created.'], 200);

            }else {
              return response()->json(['message' => 'Failed to create new student record.'], 500); // server error
            }
          } catch (Exception $e) {
            report($e);
            return false;
          }
        }
      } else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to create a new student record.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to create student record.'
          ],401); //401: Unauthorized
      }
    } // end of function store()

    /**
     * Display the specified resource.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student)
    {
      //gets the id of the current user
      $user = Auth::user();
      //Check if user has permission to view instructors
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'read_priv');

      if($isAuthorized){
        //record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed the details of ' . $student->student_number . '.',
            'time' => Carbon::now()
        ]);
        // display specific student.
        return $student;
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view the details of ' . $student->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view student records.'
          ],401); //401: Unauthorized
      }
      // return $student->first_name;
    } // end of function show()

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
      $user = Auth::user();
      //check if user have the priviledge to update course record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'update_priv');
      if($isAuthorized){
        //data validation
        $validator = Validator::make($request->all(),[
          'first_name' => 'required|string',
          'middle_name' => 'nullable|string',
          'last_name' => 'required|string',
          'suffix_name' => 'nullable|string',
          'gender' => 'required|string',
          'civil_status' => 'required|string',
          'citizenship' => 'required|string',
          'address' => 'required|string',
          'barangay' => 'required|string',
          'city' => 'required|string',
          'province' => 'required|string',
          'postal' => 'required|numeric',
          'telephone' => 'nullable|string',
          'cellphone' => 'nullable|numeric',
          'email' => 'nullable|string',
          'birth_date' => 'required',
          'birth_place' => 'required|string',
          'father_name' => 'nullable|string',
          'mother_name' => 'nullable|string',
          'contact_person' => 'required|string',
          'contact_address' => 'required|string',
          'contact_number' => 'required|numeric',
          'blood_type' => 'nullable|string',
          'photo_url' => 'required|string',
          // nullable muna ... baguhin nalang next time
          'user_id' => 'nullable|string',
          'active' => 'required|numeric',
          'student_status' => 'nullable|string',
          'school_last_attended' => 'required|string',
          'school_address' => 'required|string',
          'college_last_attended' => 'nullable|string',
          'college_address' => 'nullable|string',
          'last_track' => 'nullable|numeric',
          'last_strand' => 'nullable|numeric',
          'last_course' => 'nullable|numeric',
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update student record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $student_data = $request->all();
          $student_data['last_updated_by'] = Auth::user()->id;
          try {
             $check = $student->update($student_data);

            // check if record is successfully updated.
            if ($check) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Updated the student ' . $student->student_number . '.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'Student record successfully updated.'], 200);
            }else {
              return response()->json(['message' => 'Failed to update student record.'], 500); // server error
            }
          } catch (Exception $e) {
            report($e);
            return false;
          }
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to update the details of ' . $student->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to update student records.'
          ],401); //401: Unauthorized
      }
    } // end function update()

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
      $user = Auth::user();
      //check if user has the priviledge to delete student record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $student->delete();
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Deleted the record of student ' . $student->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json(['message' => 'Student record successfully deleted.'], 200);
        }catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to delete the record of student ' . $student->student_number . '.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to delete student records.'
          ],401); //401: Unauthorized
      }
    } // end of function destroy

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeStudentRequirements(Request $request)
    {
      $user = Auth::user();
      //check if user have the priviledge to create student requirements record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.requirements_management'), 'create_priv');
      if ($isAuthorized) {
        //data validation
        $validator = Validator::make($request->all(),[
            'student_id' => 'nullable|numeric',
            'student_number' => 'nullable',
            'url_tor' => 'image|nullable|max:1999',
            'url_good_moral' => 'image|nullable|max:1999',
            'url_form_137' => 'image|nullable|max:1999',
            'url_form_138' => 'image|nullable|max:1999',
            'url_birth_certificate' => 'image|nullable|max:1999',
            'url_photo' => 'image|nullable|max:1999',
            'url_honorable' => 'image|nullable|max:1999',
            'active' => 'required|numeric',
        ]);


        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to create new student requirement record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $student = Student::where('active', 1)
          ->orderBy('id', 'desc')
          ->first();

          // return $student->student_number;

          $requirement_data = $request->all();
          $requirement_data['last_updated_by'] = Auth::user()->id;
          $requirement_data['active'] = 1;


          // // getting the latest student
          // $student = Student::orderBy('id', 'DESC')->first();
          $requirement_data['student_number'] = $student->student_number;
          $requirement_data['id'] = $student->id;

          for ($i=0; $i <= 7; $i++) {
            if($i == 0) {
              if($request->hasFile('url_tor')){
                $extension = $request->file('url_tor')->getClientOriginalExtension();
                $requirement_data['url_tor'] = $student->student_number . "_tor." . $extension;
                $path = $request->file('url_tor')->storeAs('public/storage/images', $student->student_number . "_tor." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_tor'] = '';
              }
            }
            elseif($i == 1) {
              if($request->hasFile('url_good_moral')){
                $extension = $request->file('url_good_moral')->getClientOriginalExtension();
                $requirement_data['url_good_moral'] = $student->student_number . "_good_moral." . $extension;
                  $path = $request->file('url_good_moral')->storeAs('public/storage/images', $student->student_number . "_good_moral." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_good_moral'] = '';
              }
            }
            elseif($i == 2) {
              if($request->hasFile('url_form_137')){
                $extension = $request->file('url_form_137')->getClientOriginalExtension();
                $requirement_data['url_form_137'] = $student->student_number . "_form_137." . $extension;
                  $path = $request->file('url_form_137')->storeAs('public/storage/images', $student->student_number . "_form_137." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_form_137'] = '';
              }
            }
            elseif($i == 3 ){
              if($request->hasFile('url_form_138')){
                $extension = $request->file('url_form_138')->getClientOriginalExtension();
                $requirement_data['url_form_138'] = $student->student_number . "_form_138." . $extension;
                  $path = $request->file('url_form_138')->storeAs('public/storage/images', $student->student_number . "_form_138." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_form_138'] = '';
              }
            }
            elseif($i == 4 ){
              if($request->hasFile('url_birth_certificate')){
                $extension = $request->file('url_birth_certificate')->getClientOriginalExtension();
                $requirement_data['url_birth_certificate'] = $student->student_number . "_birth_certificate." . $extension;
                  $path = $request->file('url_birth_certificate')->storeAs('public/storage/images', $student->student_number . "_birth_certificate." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_birth_certificate'] = '';
              }
            }
            elseif($i == 5 ){
              if($request->hasFile('url_photo')){
                $extension = $request->file('url_photo')->getClientOriginalExtension();
                $requirement_data['url_photo'] = $student->student_number . "_photo." . $extension;
                  $path = $request->file('url_photo')->storeAs('public/storage/images', $student->student_number . "_photo." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_photo'] = '';
              }
            }
            elseif($i == 6 ){
              if($request->hasFile('url_honorable')){
                $extension = $request->file('url_honorable')->getClientOriginalExtension();
                $requirement_data['url_honorable'] = $student->student_number . "_honorable." . $extension;
                  $path = $request->file('url_honorable')->storeAs('public/storage/images', $student->student_number . "_honorable." . $extension);
              }else{
                // temporarily insert the no image jpg
                $requirement_data['url_honorable'] = '';
              }
            }
          }

          try {
            // return $requirement_data;
            $requirements = StudentRequirement::create($requirement_data);
            // check if record is successfully created.
            if ($requirements) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Created a new student requirement.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'New student record successfully created.'], 200);
              // return response()->json(['message' => 'New student requirement successfully created.'], 200);
            }else {
              return response()->json(['message' => 'Failed to create new student requirement record.'], 500); // server error
            }
          } catch (Exception $e) {
            report($e);
            return false;
          }
        }
      } else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to create a new student requirement.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to create student requirement records.'
          ],401); //401: Unauthorized
      }
    } // end of function store()

    public function getStudent($student_number){
      $user = Auth::user();
      //check if user has the priviledge to delete student record.
      $isAuthorized = app('App\Http\Controllers\UserPrivilegeController')->checkPrivileges($user->id, Config::get('settings.student_management'), 'delete_priv');
      if($isAuthorized){
        try {
          $student = Student::where('student_number', $student_number)->get();
          if ($student->isNotEmpty()){
            // record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Viewed the details of ' . $student[0]->student_number . '.',
                'time' => Carbon::now()
            ]);
            return $student;
          }else{
            // record in activity log
            $activityLog = ActivityLog::create([
                'user_id' => $user->id,
                'activity' => 'Tried to access invalid student number.',
                'time' => Carbon::now()
            ]);
            return response()->json([
              'message' => "Invalid student number."
            ], 400);
          }

        }catch (Exception $e) {
          report($e);
          return false;
        }
      }else{
          //record in activity log
          $activityLog = ActivityLog::create([
              'user_id' => $user->id,
              'activity' => 'Attempted to view student record.',
              'time' => Carbon::now()
          ]);
          return response()->json([
              'message' => 'You are not authorized to view student records.'
          ],401); //401: Unauthorized
      }

    } // end of function getStudent()


// START of ONLINE STUDENT Functions ============================================
    public function getOnlineStudent(Student $student){

      $user = Auth::user();
      if ($user->role == "Student") {
        // record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Student ' . $student->student_number . ' viewed own student information.',
            'time' => Carbon::now()
        ]);
        $student->enrollments = $student->enrollment;
        $student->account = $student->user;


        return $student;

      }else{
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to view information of student ' . $student->student_number . '.',
            'time' => Carbon::now()
        ]);
        return response()->json([
            'message' => 'You are not authorized to view student records.'
        ],401); //401: Unauthorized
      }
    } // end of function

    public function updateOnlineStudent(Request $request, Student $student){
      $user = Auth::user();

      if ($user->role == "Student") {
        $validator = Validator::make($request->all(),[
          'first_name' => 'required|string',
          'middle_name' => 'nullable|string',
          'last_name' => 'required|string',
          'suffix_name' => 'nullable|string',
          'gender' => 'required|string',
          'civil_status' => 'required|string',
          'citizenship' => 'required|string',
          'address' => 'required|string',
          'barangay' => 'required|string',
          'city' => 'required|string',
          'province' => 'required|string',
          'postal' => 'required|numeric',
          'telephone' => 'nullable|string',
          'cellphone' => 'nullable|numeric',
          'email' => 'nullable|string',
          'birth_date' => 'required',
          'birth_place' => 'required|string',
          'father_name' => 'nullable|string',
          'mother_name' => 'nullable|string',
          'contact_person' => 'required|string',
          'contact_address' => 'required|string',
          'contact_number' => 'required|numeric',
          'blood_type' => 'nullable|string',
          'photo_url' => 'required|string',
          // nullable muna ... baguhin nalang next time
          'user_id' => 'nullable|string',
          'active' => 'required|numeric',
          'student_status' => 'nullable|string',
          'school_last_attended' => 'required|string',
          'school_address' => 'required|string',
          'college_last_attended' => 'nullable|string',
          'college_address' => 'nullable|string',
          'last_track' => 'nullable|numeric',
          'last_strand' => 'nullable|numeric',
          'last_course' => 'nullable|numeric',
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update student record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $student_data = $request->all();
          $student_data['last_updated_by'] = Auth::user()->id;
          try {
             $check = $student->update($student_data);

            // check if record is successfully updated.
            if ($check) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Updated student record of ' . $student->student_number . '.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'Student record successfully updated.'], 200);
            }else {
              return response()->json(['message' => 'Failed to update student record.'], 500); // server error
            }
          } catch (Exception $e) {
            report($e);
            return false;
          }
        }
      }else{
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to update records of student ' . $student->student_number . '.',
            'time' => Carbon::now()
        ]);
        return response()->json([
            'message' => 'You are not authorized to update student accounts.'
        ],401); //401: Unauthorized
      }
    }// end of function updateOnlineStudent

    // this function will return enrollment records of specific student
    public function getOnlineStudentEnrollment(Request $request, Student $student){

      $user = Auth::user();

      if ($user->role == "Student") {
        // record in activity log
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Student ' . $student->student_number . ' viewed own enrollment records.',
            'time' => Carbon::now()
        ]);
        if ($request->query() != null) {
          return $student->enrollment()->where($request->query())->orderBy('id', 'DESC')->get();
        }else{
          return $student->enrollment()->orderBy('id', 'DESC')->get();
        }
      }else {
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to view enrollment records of student ' . $student->student_number . '.',
            'time' => Carbon::now()
        ]);
        return response()->json([
            'message' => 'You are not authorized to view student enrollment records.'
        ],401); //401: Unauthorized
      }
    } // end of function getOnlineStudentEnrollment


    // this function will update user account of specific student
    public function updateOnlineStudentAccount(Request $request, Student $student){
      $user = Auth::user();

      if ($user->role == "Student") {
        if($request->username == $student->user->username){
          $user_data = $request->except('username');
        }else{
          $user_data = $request->all();
        }


        $validator = Validator::make($user_data,[
          'username' => 'string',
          'password' => 'required|string',
          'first_name' => 'required|string',
          'last_name' => 'required|string'
        ]);

        // check if data if validator fails
        if ($validator->fails()) {
          return response()
          ->json([
            'message' => 'Failed to update student account record.',
            'errors' => $validator->errors()
          ], 400); // 400: Bad request
        }
        else {
          $student_data = $request->all();
          $student_data['password'] = Hash::make($request->password);;
          $student_data['last_updated_by'] = Auth::user()->id;
          try {
             $check = $student->user->update($student_data);

            // check if record is successfully updated.
            if ($check) {
              //record in activity log
              $activityLog = ActivityLog::create([
                  'user_id' => $user->id,
                  'activity' => 'Updated student account record of ' . $student->student_number . '.',
                  'time' => Carbon::now()
              ]);
              return response()->json(['message' => 'Student account record successfully updated.'], 200);
            }else {
              return response()->json(['message' => 'Failed to update student account record.'], 500); // server error
            }
          } catch (Exception $e) {
            report($e);
            return false;
          }
        }
      } else{
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to update account of student ' . $student->student_number . '.',
            'time' => Carbon::now()
        ]);
        return response()->json([
            'message' => 'You are not authorized to update student accounts.'
        ],401); //401: Unauthorized
      }
    } // end function updateOnlineStudentAccount

    public function getCourses(){
      $user = Auth::user();
      if ($user->role == "Student") {
        $courses = Course::where('active', 0)->orderBy('id', 'DESC')->with('curriculum')->get();

        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Viewed list of course records.',
            'time' => Carbon::now()
        ]);

        return $courses;
      }else{
        $activityLog = ActivityLog::create([
            'user_id' => $user->id,
            'activity' => 'Attempted to view list of courses.',
            'time' => Carbon::now()
        ]);
        return response()->json([
            'message' => 'You are not authorized to view list of courses.'
        ],401); //401: Unauthorized
      }

    }


}
