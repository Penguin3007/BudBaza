<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Review;

class HomeController extends Controller
{
    public function index(Product $product,Review $review)
    {
    	$populars = $review->orderBy('rating', 'DESC')->get();
    	foreach($populars as $popular){
    		$slugs[] = $popular->product_slug;
    	}
    	$products = $product->whereIn('slug',$slugs)->take(8)->get();
    	$new_products = $product->orderBy('created_at','DESC')->take(10)->get();
        foreach($products as $pr){
            $rating = 0;
            $reviews = $review->where('product_slug',$pr->slug)->get();
            foreach($reviews as $rev){
                $rating = $rating + (int)$rev->rating;
            }
            if(count($reviews) != 0)
                $pr['rating'] = round($rating / count($reviews));
            else
                $pr['rating'] = 0;
        }
        foreach($new_products as $pr){
            $rating = 0;
            $reviews = $review->where('product_slug',$pr->slug)->get();
            foreach($reviews as $rev){
                $rating = $rating + (int)$rev->rating;
            }
            if(count($reviews) != 0)
                $pr['rating'] = round($rating / count($reviews));
            else
                $pr['rating'] = 0;
        }
    	$arr = array(
    		'populars' 		=> $products,
    		'new_products' 	=> $new_products
    	);
        return view('home',$arr);
    }
}
