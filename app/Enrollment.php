<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Enrollment extends Model
{
  protected $fillable = ['academic_year_id', 'semester_id', 'student_id', 'year_level',
  'curriculum_id', 'created_at', 'updated_at', 'last_updated_by', 'course_id', 'strand_id', 'active', 'block', 'student_status', 'academic_status', 'date_enrolled'];

    public function student(){
      return $this->belongsTo('App\Student')->select('*');
    }

    public function course(){
      return $this->belongsTo('App\Course')->select('*');
    }

    public function strand(){
      return $this->belongsTo('App\Strand')->select('*');
    }

    public function academic_year(){
      return $this->belongsTo('App\AcademicYear')->select('*');
    }

    public function semester(){
      return $this->belongsTo('App\Semester')->select('*');
    }

    public function curriculum(){
      return $this->belongsTo('App\Curriculum')->select('*');
    }

    public function student_schedule(){
      return $this->hasMany('App\StudentSchedule')->select('*')->with('curriculum_subject', 'enrollment');
    }

}
