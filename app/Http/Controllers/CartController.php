<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class CartController extends Controller
{
    public function index(){
        return view('cart');
    }

    public function add(Product $product,Request $request)
    {   
        $id = $request->id;
        $qty = $request->qty;
        if(empty($qty)){
            $qty = 1;
        }
        $products = $product->where('id',$id)->get();
        foreach(\Cart::content() as $item){
            if($item->id == $id){
                foreach($products as $product){
                    if($item->qty+$qty > $product->quanity){
                        $data['code']  = 2;
                        $data['items'] = $product->quanity;
                        return $data;
                    }else{
                        \Cart::update($item->rowId, $item->qty+$qty);
                        $data['code'] = 1;
                        return $data;
                    }
                }
            }
        }
    	foreach($products as $product){
            $img = json_decode($product->img);
            if($qty > $product->quanity){
                $data['code']  = 2;
                $data['items'] = $product->quanity;
                return $data;
            }else{
                \Cart::add($product->id, $product->title, $qty, $product->price,['img' => $img[0]]);
                $data['code']  = 1;
                return $data;
            }
        }
    }

    public function delete(Request $request)
    {
        $rowId = $request->rowId;
        \Cart::remove($rowId);
        return redirect($request->server('HTTP_REFERER'));
    }
}
