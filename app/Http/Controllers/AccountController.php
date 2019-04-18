<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;

class AccountController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        return view('account');
    }
}
