<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentSchedule extends Model
{
  protected $fillable = ['enrollment_id', 'subject_id', 'prelim_grade', 'midterm_grade',
  'prefinal_grade', 'final_grade', 'semestral', 'remarks', 'figure', 'status', 'active', 'last_updated_by'];

  public function enrollment(){
    return $this->belongsTo('App\Enrollment')->select('*')->with('student');
  }
}
