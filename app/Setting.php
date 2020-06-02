<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $fillable = [ 'current_academic_year', 'current_semester' ];
}
