<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Review;

class HomeController extends Controller
{
    public function index(Product $product,Review $review)
    {
    	$populars = $review->orderBy('rating', 'desc')->get();
    	foreach($populars as $popular){
    		$slugs[] = $popular->product_slug;
    	}
    	$products = $product->whereIn('slug',$slugs)->get();
        return view('home',['populars' => $products]);
    }
}
