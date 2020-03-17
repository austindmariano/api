<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;

class UserPrivilege extends Pivot
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'activity_id', 'create_priv', 'read_priv', 'update_priv', 'delete_priv', 'last_updated_by'
    ];
    public $incrementing = true;
}
