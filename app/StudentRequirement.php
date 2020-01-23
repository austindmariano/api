<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentRequirement extends Model
{
  protected $fillable = ['id', 'student_number', 'url_tor', 'url_good_moral', 'url_form_137', 'url_form_138', 'url_birth_certificate', 'last_updated_by'];
}
