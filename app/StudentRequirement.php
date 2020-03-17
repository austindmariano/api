<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentRequirement extends Model
{
  protected $fillable = ['student_id', 'student_number', 'url_tor',
  'url_good_moral', 'url_form_137', 'url_form_138', 'url_birth_certificate',
  'url_photo', 'url_honorable', 'last_updated_by', 'active'];

  public function student(){
    $data = $this->belongsTo('App\Student')->select('*');
    return $data;

  } // end of function curriculums


}
