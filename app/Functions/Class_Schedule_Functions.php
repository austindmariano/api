<?
namespace App\Functions\Class_Schedule_Functions;

class Schedules {

 //  public function getClassSchedule(){
 //   $classes = ClassSchedule::orderBy('id', 'DESC')->get();
 //   $myArr = [];
 //   $i = 0;
 //   foreach ($classes as $class) {
 //     $sched_time_start  = date("g:iA", strtotime($class->time_start));
 //     $sched_time_end  = date("g:iA", strtotime($class->time_end));
 //     $myArr[$i] = array(
 //       'id' => $class->id,
 //       'subject' => array(
 //         'curr_subject_id' => $class->subject->id,
 //         'subject_id' => $class->subject->subject_id,
 //         'subject_code' => $class->subject->subject->subject_code,
 //         'subject_desc' => $class->subject->subject->subject_description,
 //         'year_level' => $class->subject->year_level,
 //         'units' => $class->subject->subject->units,
 //         'lec' => $class->subject->subject->lec,
 //         'lab' => $class->subject->subject->lab,
 //         'active' => $class->subject->subject->active,
 //       ),
 //       'curriculum' => array(
 //         'curriculum_id' => $class->subject->curriculum->id,
 //         'curriculum_title' => $class->subject->curriculum->curriculum_title,
 //         'curriculum_desc' => $class->subject->curriculum->curriculum_desc,
 //       ),
 //       'course' => array(
 //         'id' => $class->subject->curriculum->course->id,
 //         'course_code' => $class->subject->curriculum->course->course_code,
 //         'course_desc' => $class->subject->curriculum->course->course_desc,
 //         'course_major' => $class->subject->curriculum->course->course_major
 //       ),
 //      'room' => array(
 //         'id' => $class->room->id,
 //         'room_number' => $class->room->room_number,
 //         'room_name' => $class->room->room_name,
 //         'room_capacity' => $class->room->room_capacity,
 //       ),
 //      'instructor_id' => array(
 //         'id' => $class->instructor->id,
 //         'first_name' => $class->instructor->first_name,
 //         'middle_name' => $class->instructor->middle_name,
 //         'last_name' => $class->instructor->last_name,
 //         'full_name' => $class->instructor->first_name . " " . $class->instructor->last_name
 //       ),
 //       'schedule' => array(
 //         'day' => $class->day,
 //         'time_start' => $sched_time_start,
 //         'time_end' => $sched_time_end,
 //         'time' => $sched_time_start . "-" . $sched_time_end
 //       ),
 //       'sem' => array(
 //         'id' => $class->semester->id,
 //         'semester' => $class->semester->semester,
 //       ),
 //       'ay' => array(
 //         'id' => $class->academic_year->id,
 //         'academic_year' => $class->academic_year->academic_year,
 //         'formatted_ay' => "SY " . $class->academic_year->academic_year
 //       )
 //     );
 //     $i++;
 //   }
 //   return $myArr;
 // } // end of function getClassSchedule
}
 ?>
