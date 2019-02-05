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

Route::post('/add_review','ReviewController@create');
Route::post('/add_to_cart', 'CartController@add');




Route::get('/', 'HomeController@index');
Route::get('/shop', 'ShopController@index');
Route::get('/cart', 'CartController@index');
Route::get('/shop/{slug}', 'ShopController@product');
Route::get('/delete_from_cart/{rowId}', 'CartController@delete');

Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
