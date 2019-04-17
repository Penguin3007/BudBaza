@extends('layouts.app')

@section('banner')
    <div class="page-banner-section section">
        <div class="container">
            <div class="row">
                <div class="col">
                    
                    <div class="page-banner text-center">
                        <h1>Корзина</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="/">Главная</a></li>
                            <li>Корзина</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('content')
    <!-- Cart Section Start -->
    <div class="cart-section section position-relative pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20 fix">
        @csrf
        <div class="container">
            <div class="row">
                <div class="col-12">
                @if(count(\Cart::content()) > 0)
                    <form action="#">               
                        <!-- Cart Table -->
                        <div class="cart-table table-responsive mb-30">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="pro-thumbnail">Изображение</th>
                                        <th class="pro-title">Название</th>
                                        <th class="pro-price">Цена</th>
                                        <th class="pro-quantity">Количество</th>
                                        <th class="pro-subtotal">Стоимость</th>
                                        <th class="pro-remove">Удалить</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach(\Cart::content() as $item)
                                        <tr>
                                            <td class="pro-thumbnail"><a href="#"><img src="{{ Voyager::image($item->options->img) }}" alt="Product"></a></td>
                                            <td class="pro-title"><a href="/shop/{{ $item->options->slug }}">{{ $item->name }}</a></td>
                                            <td class="pro-price"><span>{{ $item->options->price }} ₴</span></td>
                                            <td class="pro-quantity"><div class="pro-qty"><input type="text" data-id="{{ $item->id }}" class="cart_quan" id="cart_quan" value="{{ $item->qty }}"></div></td>
                                            <td class="pro-subtotal"><span>{{ (int)$item->options->price * (int)$item->qty }} ₴</span></td>
                                            <td class="pro-remove"><a href="/cart/delete/{{ $item->rowId }}"><i class="fa fa-trash-o"></i></a></td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                    </form> 

                    <div class="row" style="justify-content: flex-end;">
                        <!-- Cart Summary -->
                        <div class="col-lg-6 col-12 mb-30 d-flex">
                            <div class="cart-summary">
                                <div class="cart-summary-wrap">
                                    <h4>Итого</h4>
                                    <p>Стоимость <span>{{ \Cart::subtotal() }} ₴</span></p>
                                </div>
                                <div class="cart-summary-button">
                                    <a class="checkout-btn" href="/checkout">Оформить</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @else
                    <form action="#">               
                        <!-- Cart Table -->
                        <div class="cart-table table-responsive mb-30">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="pro-thumbnail">Изображение</th>
                                        <th class="pro-title">Название</th>
                                        <th class="pro-price">Цена</th>
                                        <th class="pro-quantity">Количество</th>
                                        <th class="pro-subtotal">Стоимость</th>
                                        <th class="pro-remove">Удалить</th>
                                    </tr>
                                </thead>
                            </table>
                            <h2 style="width: 100%;text-align: center;">Корзина пустая</h2>
                        </div>
                    </form> 
                @endif
                </div>
            </div>
        </div>
        
    </div><!-- Cart Section End -->
    
    <!-- Brand Section Start -->
    <div class="brand-section section pb-90 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
            <div class="row">
                
                <div class="brand-slider section">
                    <div class="brand-item col"><img src="assets/images/brands/brand-1.png" alt=""></div>
                    <div class="brand-item col"><img src="assets/images/brands/brand-2.png" alt=""></div>
                    <div class="brand-item col"><img src="assets/images/brands/brand-3.png" alt=""></div>
                    <div class="brand-item col"><img src="assets/images/brands/brand-4.png" alt=""></div>
                    <div class="brand-item col"><img src="assets/images/brands/brand-5.png" alt=""></div>
                </div>
                
            </div>
        </div>
    </div><!-- Brand Section End -->
    
        <!-- Service Section Start -->
    <div class="service-section section pl-15 pr-15 pl-lg-30 pr-lg-30 pl-md-30 pr-md-30">
        <div class="service-container">
            <div class="row ml-0 mr-0">
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>Доставка по всему Харькову</h3>
                        <p>Доставка курьером осуществляется в пределах города Харькова</p>
                    </div>
                </div>
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>Качество товаров</h3>
                        <p>Мы работаем только с проверенными производителя, качество наша сильная сторона</p>
                    </div>
                </div>
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>Срок доставки от 1 до 2 дней</h3>
                        <p>Малогабаритные товары доставляем в день заказа</p>
                    </div>
                </div>
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>Круглосуточная онлайн поддержка 24/7</h3>
                        <p>У нас работает круглосуточная поддержка, которая поможет вам и ответи на все ваши вопросы</p>
                    </div>
                </div>
                
            </div>
        </div>
    </div><!-- Service Section End -->
@endsection