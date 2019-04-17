<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\OrderItem;
use App\User;

class CheckoutController extends Controller
{
    public function index(){
        return view('checkout');
    }

    public function create(Request $request,User $user, Order $order, OrderItem $oi){
    	$price = \Cart::subtotal();
    	if($request->shipping_method == 'delivery'){
    		$price += 100;
    	}
    	if($request->create_account){
    		$email = $user->where('email',$request->email)->get();
    		if(count($email) > 0){
    			$user_id = $email[0]->id;
    		}else{
    			$pass = str_random(5);
    			$user_id = $user->insert([
	    			[
	    				'role_id'	=> 2,
	    				'name' 		=> $request->f_name,
	    				'email' 	=> $request->email,
	    				'password'  => \Hash::make($pass)
	    			]
	    		]);
	    		\Mail::send('emails.registered', ['request' => $request,'pass' => $pass], function ($m) use ($request) {
                	$m->from('stefaniuk3007@gmail.com', 'Магазин BudBaza');
                	$m->to($request->email, 'Получатель')->subject('Спасибо за регистрацию на сайте BudBaza.');
    			});
    		}
    	}else{
    		$user_id = NULL;
    	}
    	$order_id = $order->insert([
		    [
		    	'price'  => $price,
		    	'status' => 'wait-for-pay',
		    	'user_id'=> $user_id,
		    	'f_name' => $request->f_name,
		    	'l_name' => $request->l_name,
		    	'email'  => $request->email,
		    	'phone'  => $request->phone,
		    	'shipping_method' => $request->shipping_method,
		    	'payment_method' => $request->payment_method,
		    	'address' => $request->address
		    ]
		]);
    	\Mail::send('emails.ordered', ['request' => $request], function ($m) use ($request) {
            $m->from('stefaniuk3007@gmail.com', 'Магазин BudBaza');
            $m->to($request->email, 'Получатель')->subject('Спасибо за заказ на сайте BudBaza.');
    	});
		foreach(\Cart::content() as $item){
			$oi->insert([
				['order_id' => $order_id,'product_id' => $item->id]
			]);
		}
		\Cart::destroy();
		$data['code'] = 1;
		return $data;
    }
}
