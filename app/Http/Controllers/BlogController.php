<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;

class BlogController extends Controller
{
    public function index(Post $post)
    {
    	$posts = $post->paginate(6);
    	return view('blog',['posts' => $posts]);
    }

    public function post(Request $request, Post $post){
    	$slug = $request->slug;
    	$post = $post->where('slug',$slug)->get();
    	return view('post',['post' => $post]);
    }
}
