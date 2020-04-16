<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    protected $fillable = ['user_id', 'activity', 'time'];
    public $timestamps = false;

    public function user(){
      return $this->belongsTo('App\User')->select('*');
    }
}
