<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'email', 'password', 'first_name', 'middle_name',
        'last_name', 'role', 'last_updated_by', 'active', 'blocked', 'attempts'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
     // remove password from protected $hidden for testing purposes
    // protected $hidden = [
    //    'password',
    // ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function privileges(){
      return $this->belongsToMany('App\UserActivity', 'user_privileges', 'user_id', 'activity_id')
                  ->select(['activity_id', 'code', 'title'])
                  ->using('App\UserPrivilege')
                  ->as('privileges')
                  ->withPivot([
                    'id', 'create_priv', 'read_priv',
                    'update_priv', 'delete_priv', 'lock'
                  ]);
    }

    public function student(){
      return $this->hasOne('App\Student')->with('enrollment');
    }

    public function logs(){
      return $this->hasMany('App\ActivityLog')->orderBy('id', 'DESC');
    }
}
