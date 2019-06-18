@extends('layouts.app')

@section('banner')
    <div class="page-banner-section section">
        <div class="container">
            <div class="row">
                <div class="col">             
                    <div class="page-banner text-center">
                        <h1>Магазин</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="/">Главная</a></li>
                            <li>Магазин</li>
                        </ul>
                    </div>               
                </div>
            </div>
        </div>
    </div>
@endsection
@section('content')
<!-- Product Section Start -->
    <div class="product-section section pt-90 pb-90 pt-lg-80 pb-lg-80 pt-md-70 pb-md-70 pt-sm-60 pb-sm-60 pt-xs-50 pb-xs-50">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-8 col-12 order-1 order-lg-2">
            <!-- Shop Toolbar Start -->
            <div class="row">
                <div class="col">
                    <div class="shop-toolbar">
                        <div class="product-showing mr-auto">
                            <p>Показано {{ count($products) }} из {{ $total }}</p>
                        </div>
                        <div class="product-short">
                            <p>Сортировка</p>
                            <select class="nice-select">
                                <option value="title" selected>Название</option>
                                <option value="price-asc">Цена от дешевых</option>
                                <option value="price-desc">Цена от дорогих</option>
                                <option value="rating">Популярность</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div><!-- Shop Toolbar End -->

            <div class="shop-product-wrap products-list-grid row">
                @if( count($products) == 0 )
                    <h4>Не найдено товаров по вашему запросу</h4>
                @endif
                @foreach($products as $product)
	                <div class="col-xl-4 col-sm-6 col-12 mb-30 product-item-wrapper">
	                    <div class="product-item">
	                        <!-- Image -->
	                        <div class="product-image">
	                            <!-- Image -->
	                            <?php $imgs = json_decode($product->img); ?>
	                            <a href="/shop/{{ $product->slug }}" class="image"><img src="{{ Voyager::image($imgs[0]) }}" alt=""></a>
	                            <!-- Product Action -->
	                            <div class="product-action">
                                    @csrf
	                                <a data-id="{{ $product->id }}" href="javascript:void(0)" class="cart add-to-cart"><span></span></a>
	                            </div>
	                        </div>
	                        <!-- Content -->
	                        <div class="product-content">
	                            <div class="head">
	                                <!-- Title-->
	                                <div class="top">
	                                    <h4 class="title"><a href="/shop/{{ $product->slug }}">{{ $product->title }}</a></h4>
	                                </div>
	                                <!-- Price & Ratting -->
	                                <div class="bottom">
                                        <span class="price">{{ isset($product->disc_price) ? $product->disc_price : $product->price }} ₴ 
                                                {!! isset($product->disc_price) ? '<span class="old">'. $product->price .' ₴</span>' : '' !!}
                                        </span>
	                                    <span class="ratting">  
                                            @if($product->rating == 0)
                                                <p>Нет отзывов</p>
                                            @elseif($product->rating == 1)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($product->rating == 2)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($product->rating == 3)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($product->rating == 4)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($product->rating >= 5)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            @endif
                                        </span>
	                                </div>
	                            </div>
	                            <div class="body">
	                                {!! $product->desc !!}
	                                <!-- Product Action -->
	                                <div class="product-action">
	                                    <a data-id="{{ $product->id }}" href="javascript:void(0)" class="cart"><span></span></a>
	                                    <a href="/shop/{{ $product->slug }}" class="quickview"><span></span></a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            @endforeach
            </div>

            <div class="row mt-20">
                <div class="col">
					{{ $products->links('links.products') }}
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-lg-4 col-12 order-2 order-lg-1 pr-30 pr-sm-15 pr-md-15 pr-xs-15">

                    <div class="sidebar">
                        <h4 class="sidebar-title">Поиск</h4>
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="sidebar-search">
                            <form action="/search" method="GET">
                                <input required type="text" name="value" value="<?php echo (!empty($_GET['value'])) ? $_GET['value'] : ''; ?>" placeholder="Введите название">
                                <input type="submit" value="Поиск">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!-- Product Section End -->
    
<!-- Service Section Start -->
<div class="service-section section pl-15 pr-15 pl-lg-30 pr-lg-30 pl-md-30 pr-md-30">
    <div class="service-container">
        <div class="row ml-0 mr-0">
            <div class="service col-xl-3 col-md-6 col-12">
                <div class="icon"></div>
                <div class="content">
                    <h3>Бесплатная доставка</h3>
                    <p>Бесплатная доставка в пределах города Харькова</p>
                </div>
            </div>
            <div class="service col-xl-3 col-md-6 col-12">
                <div class="icon"></div>
                <div class="content">
                    <h3>Качество товаров</h3>
                    <p>Мы работаем только с проверенными производителя</p>
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
                    <h3>Онлайн поддержка 24/7</h3>
                    <p>У нас работает круглосуточная поддержка</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service Section End -->
@endsection