<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserActivity extends Model
{
    //
    public function priviledge(){
        return $this->hasMany('App\UserPrivilege');
    }
}
