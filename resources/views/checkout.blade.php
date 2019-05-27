@extends('layouts.app')

@section('banner')
    <!-- Page Banner Section Start -->
    <div class="page-banner-section section">
        <div class="container">
            <div class="row">
                <div class="col">

                    <div class="page-banner text-center">
                        <h1>Оформление заказа</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="/">Главная</a></li>
                            <li>Оформление заказа</li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </div><!-- Page Banner Section End -->
@endsection
@section('content')
<!-- Cart Section Start -->
    <div class="cart-section section position-relative pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20 fix">
       
        <div class="container">
            <div class="row">
                <div class="col-12">
                
                    <!-- Checkout Form s-->
                    <form action="javascript:void(0)" class="checkout-form">
                        @csrf
                       <div class="row row-40">

                           <div class="col-lg-7">

                               <!-- Billing Address -->
                               <div id="billing-form" class="mb-10">
                                   <h4 class="checkout-title">Данные о покупателе</h4>

                                   <div class="row">

                                       <div class="col-md-6 col-12 mb-20">
                                           <label>Имя*</label>
                                           <input required name="f_name" type="text" placeholder="Имя">
                                       </div>

                                       <div class="col-md-6 col-12 mb-20">
                                           <label>Фамилия*</label>
                                           <input required name="l_name" type="text" placeholder="Фамилия">
                                       </div>

                                       <div class="col-md-6 col-12 mb-20">
                                           <label>Email*</label>
                                           <input required name="email" type="email" placeholder="Email">
                                       </div>

                                       <div class="col-md-6 col-12 mb-20">
                                           <label>Телефон*</label>
                                           <input required name="phone" type="text" placeholder="Телефон">
                                       </div>

                                       <div class="col-12 mb-20">
                                           <label>Адрес*</label>
                                           <input name="addr" required type="text" placeholder="Адрес">
                                       </div>

                                       <div class="col-12 mb-20">
                                           <div class="check-box">
                                               <input type="checkbox" name="create_account" id="create_account">
                                               <label for="create_account">Создать аккаунт?</label>
                                           </div>
                                       </div>

                                   </div>

                               </div>

                           </div>

                           <div class="col-lg-5">
                               <div class="row">

                                   <!-- Cart Total -->
                                   <div class="col-12 mb-60">

                                       <h4 class="checkout-title">Товары  к оплате</h4>

                                       <div class="checkout-cart-total">

                                           <h4>Товар <span>Всего</span></h4>

                                           <ul>
                                                @foreach(\Cart::content() as $item)
                                                    <li>{{ $item->name }} X @if($item->qty < 10) 0{{ $item->qty }} @else {{ $item->qty }} @endif <span>{{ (int)$item->options->price * (int)$item->qty }} ₴</span></li>
                                                @endforeach
                                           </ul>
                                           <p>Стоимость доставки <span class="del_tax">0 ₴</span></p>
                                           <p>Итого <span>{{ \Cart::subtotal() }} ₴</span></p>
                                       </div>

                                   </div>
                                    
                                    <!-- Payment Method -->
                                   <div class="col-12 mb-30">

                                       <h4 class="checkout-title">Способ доставки</h4>

                                       <div class="checkout-payment-method">
                                        @foreach($d_methods as $d_method)
                                          <div class="single-method">
                                            <input required type="radio" id="pickup" name="shipping_method" value="pickup">
                                            <label for="pickup">{{ $d_method->title }}</label>
                                          </div>
                                        @endforeach
                                      
                                       </div>

                                       <h4 class="checkout-title">Способ оплаты</h4>

                                       <div class="checkout-payment-method">
                                        @foreach($p_methods as $p_method)
                                           <div class="single-method">
                                               <input required type="radio" id="payment_check" name="payment-method" value="check">
                                               <label for="payment_check">{{ $p_method->title }}</label>
                                               {{-- <p data-method="check">Оплачиваете наличными, при получении товара</p> --}}
                                           </div>
                                          @endforeach

                                       </div>

                                       <button type="submit" class="place-order btn btn-lg btn-round">Оформить</button>

                                   </div>

                               </div>
                           </div>

                       </div>
                    </form> 
                    
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