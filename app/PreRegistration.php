<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PreRegistration extends Model
{
    protected  $fillable = [
      'first_name', 'middle_name', 'last_name', 'suffix_name',
      'gender', 'civil_status', 'citizenship',
      'address', 'barangay', 'city', 'province', 'postal',
      'telephone', 'cellphone', 'email',
      'birth_date', 'birth_place', 'father_name', 'mother_name',
      'contact_person', 'contact_address', 'contact_number', 'blood_type',
      'photo_url', 'user_id', 'active', 'student_status',
      'school_last_attended', 'school_address',
      'college_last_attended', 'college_address',
      'last_track', 'last_strand', 'last_course', 'registration_code'
    ];
}
