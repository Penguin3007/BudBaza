<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Review;

class ReviewController extends Controller
{
	public function index(Request $request,Review $review){
		$product_slug = $request->$product_slug;
		$reviews = $review->where('product_slug',$product_slug)->get();
		return $reviews;
	}

	public function create(Request $request,Review $review){
		$emails = $review->where('email',$request->email)->where('product_slug',$request->slug)->get();
		if(count($emails) > 0){
			$data['code'] == 3;
		} 
		$id = $review->insert([
			[
				'product_slug' 	=> $request->slug,
				'name' 			=> $request->name,
				'email' 		=> $request->email,
				'text' 			=> $request->text,
				'rating'		=> $request->rating,
				'status'		=> 'in-review' 	
			]
		]);

		if(!empty($id)){
			$data['code'] = 1;
		}else{
			$data['code'] = 2;
		}
		return $data;
	}
}
