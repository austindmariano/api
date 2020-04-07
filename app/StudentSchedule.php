<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentSchedule extends Model
{
  protected $fillable = ['enrollment_id', 'subject_id', 'prelim_grade', 'midterm_grade',
  'prefinal_grade', 'final_grade', 'semestral', 'remarks', 'figure', 'status', 'active', 'last_updated_by'];
<<<<<<< HEAD

  public function enrollment(){
    return $this->belongsTo('App\Enrollment')->select('*')->with('student');
  }

  public function curriculum_subject(){
    return $this->belongsTo('App\CurriculumSubject', 'subject_id')->select('*')->with('subject');
  }
=======
>>>>>>> 6e6a446a37989a5b1402531df210f3f926cf3c98
}
