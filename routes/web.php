<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/* POST REQUESTS */
Route::post('/add_review','ReviewController@create');

/* GET REQUESTS */
Route::get('/', 'HomeController@index');

Route::group(['prefix' => 'blog'], function () {
	Route::get('/','BlogController@index');
	Route::get('/{slug}','BlogController@post');
});

/* SHOP REQUESTS */
Route::group(['prefix' => 'shop'], function () {
	Route::get('/', 'ShopController@index');
	Route::get('/{slug}', 'ShopController@product');
});

/* CHECKOUT REQUESTS */
Route::group(['prefix' => 'checkout'],function(){
	Route::get('/','CheckoutController@index');
	Route::post('/order','CheckoutController@create');
});

/* ACCOUNT REQUESTS */
Route::group(['prefix' => 'account'], function () {
    Route::get('/','AccountController@index');
});

/* CART REQUESTS */
Route::group(['prefix' => 'cart'], function () {
    Route::get('/', 'CartController@index');
    Route::post('/add', 'CartController@add');
    Route::post('/update', 'CartController@update');
    Route::get('/delete/{rowId}', 'CartController@delete');    
});

Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
