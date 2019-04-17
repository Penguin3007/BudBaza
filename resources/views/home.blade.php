@extends('layouts.app')

@section('content')
    <!-- Banner Section Start -->
    <div class="banner-section section pb-90 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
            
            <div class="row">
                <div class="col-12">
                    <div class="banner"><a href="#"><img src="{{ asset('images/banner.jpg') }}" alt=""></a></div>
                </div>
            </div>
            
        </div>
    </div><!-- Banner Section End -->
    
    <!-- Product Section Start -->
    <div class="product-section section pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20">
        <div class="container">
           
            <!-- Section Title Start -->
            <div class="row">
                <div class="col">
                    <div class="section-title left mb-60 mb-xs-40">
                        <h1>Популярные товары</h1>                        
                    </div>
                </div>
            </div><!-- Section Title End -->
            
            <div class="row">
                
                @foreach($populars as $product)
                    <!-- Product Item Start -->
                    <div class="col-xl-3 col-lg-4 col-sm-6 col-12 mb-30">
                        <div class="product-item">
                            <!-- Image -->
                            <div class="product-image">
                                <!-- Image -->
                                <a href="product-details-variable.html" class="image"><img src="{{ Voyager::image(json_decode($product->img)[0]) }}" alt=""></a>
                                <!-- Product Action -->
                                <div class="product-action">
                                    <a data-id="{{ $product->id }}" href="javascript:void(0)" class="cart"><span></span></a>
                                    <a href="/shop/{{ $product->slug }}" class="quickview"><span></span></a>
                                </div>
                            </div>
                            <!-- Content -->
                            <div class="product-content">
                                <div class="head">
                                    <!-- Title -->
                                    <div class="top">
                                        <h4 class="title"><a href="/shop/{{ $product->slug }}">{{ $product->title }}</a></h4>
                                    </div>
                                    <!-- Price & Ratting -->
                                    <div class="bottom">
                                        <span class="price">{{ $product->price }} ₴</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- Product Item End -->
                @endforeach
                
            </div>
            
        </div>
    </div><!-- Product Section End -->
    
    <!-- Brand Section Start -->
    <div class="brand-section section pb-90 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
            <div class="row">
                
                <div class="brand-slider section">
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-1.png') }}" alt=""></div>
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-2.png') }}" alt=""></div>
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-3.png') }}" alt=""></div>
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-4.png') }}" alt=""></div>
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-5.png') }}" alt=""></div>
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
