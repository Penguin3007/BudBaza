<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\CategoryProduct;
use App\Review;

class ShopController extends Controller
{
    public function index(Product $product)
    {
    	$count = $product->count('id');
    	$products = $product->paginate(8);
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
        return view('product',['product' => $pr[0],'reviews' => $reviews]);
    }
}
