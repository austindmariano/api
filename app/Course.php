<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Course;
use App\Curriculum;

class Course extends Model
{
    protected $fillable = ['course_code', 'course_desc', 'course_major', 'year_duration', 'active', 'last_updated_by'];

    public function curriculum(){
      // hindi gumagana
      // return $this->hasMany('App\Curriculum')->select(array('id', 'curriculum_title', 'curriculum_desc'))->get();
      //eto gumagana
      $data = $this->hasMany('App\Curriculum')->select('*')->orderBy('id', 'DESC')->with('curriculum_subjects')->where('active', 1);
      return $data;
      // return $this->hasMany('App\Curriculum')->select('*')->orderBy('id', 'DESC');

    } // end of function curriculums

    public function class_schedules(){
      // original code
      // return $this->hasMany('App\ClassSchedule')->select('*')->orderBy('id', 'DESC');

      $data = $this->hasMany('App\ClassSchedule')->select('*');

      return $data;
    }
}
