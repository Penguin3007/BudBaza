<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;

class AccountController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        return view('account');
    }

    public function change_pass(){

    }

    public function update(User $user){
    	
    }
}
