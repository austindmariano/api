<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ResetPassword extends Model
{
  protected $table = "reset_passwords";
  protected $fillable = ['user_id', 'email', 'token', 'active'];
}
