<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\CategoryProduct;
use App\Review;

class ShopController extends Controller
{
    public function index(Product $product, Review $review)
    {
    	$count = $product->count('id');
    	$products = $product->paginate(8);        
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
    	$data = array(
    		'products' => $products,
    		'total' => $count
    	);
    	return view('shop',$data);
    }

    public function product(CategoryProduct $cp, Request $request, Product $product,Review $review)
    {
        $reviews = $review->where('product_slug',$request->slug)->get();
        $pr = $product->where('slug',$request->slug)->get();
        $rating = 0;
        foreach($reviews as $rev){
            $rating = $rating + (int)$rev->rating;
        }
        if(count($reviews) > 0)
            $rating = $rating / count($reviews);
        return view('product',['product' => $pr[0],'reviews' => $reviews,'rating' => round($rating)]);
    }
}
