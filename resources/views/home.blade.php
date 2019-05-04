@extends('layouts.app')

@section('content')
    <!-- Hero Section Start -->
    <div class="hero-slider section">
        <!-- Hero Item Start -->
        <div class="hero-item" style="background-image: url({{ asset('images/slider/slider-bg-1.jpg') }})">
            <div class="container">
                <div class="row">
                    
                    <div class="hero-content-wrap col">
                        <div class="hero-content text-center">
                            <h2>BEARD OIL</h2>
                            <h1>FOR GLOSSY AND <br>STYLISH BEARD</h1>
                            <a class="btn btn-round btn-lg btn-theme" href="shop-4-column.html">SHOP NOW</a>
                        </div>
                        <div class="hero-image">
                            <img src="{{ asset('images/slider/slider-product-1.png') }}" alt="">
                        </div>
                    </div>
                    
                </div>
            </div>
        </div><!-- Hero Item End -->
        <!-- Hero Item Start -->
        <div class="hero-item" style="background-image: url({{ asset('images/slider/slider-bg-1.jpg') }})">
            <div class="container">
                <div class="row">
                    
                    <div class="hero-content-wrap col">
                        <div class="hero-content text-center">
                            <h2>BEARD OIL</h2>
                            <h1>FOR GLOSSY AND <br>STYLISH BEARD</h1>
                            <a class="btn btn-round btn-lg btn-theme" href="shop-4-column.html">SHOP NOW</a>
                        </div>
                        <div class="hero-image">
                            <img src="{{ asset('images/slider/slider-product-1.png') }}" alt="">
                        </div>
                    </div>
                    
                </div>
            </div>
        </div><!-- Hero Item End -->
    </div><!-- Hero Section End -->

    <!-- About Section Start -->
    <div class="about-section section position-relative pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20 fix">
       
        <!-- About Section Shape -->
        <div class="about-shape one rellax" data-rellax-speed="-5" data-rellax-percentage="0.5"><img src="{{ asset('images/shape/about-shape-1.png') }}" alt=""></div>
        <div class="about-shape two rellax" data-rellax-speed="3" data-rellax-percentage="0.5"><img src="{{ asset('images/shape/about-shape-2.png') }}" alt=""></div>
       
        <div class="container">
            <div class="row align-items-center">
                
                <!-- About Image Start -->
                <div class="col-lg-6 col-12 order-1 order-lg-2 mb-30">
                    <div class="about-image masonry-grid row row-7">
                        <div class="col-6 col"><img src="{{ asset('images/about/about-1-1.jpg') }}" alt=""></div>
                        <div class="col-6 col"><img src="{{ asset('images/about/about-1-2.jpg') }}" alt=""></div>
                        <div class="col-6 col"><img src="{{ asset('images/about/about-1-3.jpg') }}" alt=""></div>
                        <div class="col-6 col"><img src="{{ asset('images/about/about-1-4.jpg') }}" alt=""></div>
                    </div>
                </div><!-- About Image End -->
                
                <!-- About Content Start -->
                <div class="col-lg-6 col-12 mr-auto order-2 order-lg-1 mb-30">
                    <div class="about-content about-content-1">
                        <h3>Provide the best</h3>
                        <h1>Beard Oil For You</h1>
                        <div class="desc">
                            <p>We provide the best Beard oil all over the worl. We are the world best store for Beard Oil. You can buy our product witho ut any hegitation because we always consus about our product quality and always maintain it properly so your can trust</p>
                            <p>Some of our customer say’s that they trust us and buy our product without any hagitation because they belive</p>
                        </div>
                        <a href="about.html" class="btn btn-lg btn-round">Learn More</a>
                    </div>
                </div><!-- About Content End -->
                
            </div>
        </div>
        
    </div><!-- About Section End -->
    
    <!-- Product Section Start -->
    <div class="product-section section pb-90 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
           
            <!-- Section Title Start -->
            <div class="row">
                <div class="col">
                    <div class="section-title left mb-60 mb-xs-40">
                        <h1>Новые товары</h1>
                        <p>Некоторые из наших клиентов говорят, что они доверяют нам и покупают наши товары без каких-либо сомнений, потому что они верят нам и всегда рады купить наши товары.</p>
                    </div>
                </div>
            </div><!-- Section Title End -->
            
            <div class="row">
                
                <!-- Product Slider 4 Column Start-->
                <div class="product-slider product-slider-4 section">
                    @foreach($new_products as $product)
                        <!-- Product Item Start -->
                        <div class="col">                        
                            <div class="product-item">
                                <!-- Image -->
                                <div class="product-image">
                                    <!-- Image -->
                                    <a href="/product/{{ $product->slug }}" class="image">
                                        @php $img = json_decode($product->img); @endphp
                                        <img src="{{ Voyager::image($img[0]) }}" alt=""></a>
                                    <!-- Product Action -->
                                    <div class="product-action">
                                        <a data-id="{{ $product->id }}" href="javascript:void(0)" class="cart add-to-cart"><span></span></a>
                                        <a href="#" class="quickview"><span></span></a>
                                    </div>
                                </div>
                                <!-- Content -->
                                <div class="product-content">
                                    <div class="head">
                                        <!-- Title -->
                                        <div class="top">
                                            <h4 class="title"><a href="/product/{{ $product->slug }}">{{ $product->title }}</a></h4>
                                        </div>
                                        <!-- Price & Ratting -->
                                        <div class="bottom">
                                            <span class="price">{{ isset($product->disc_price) ? $product->disc_price : $product->price }}₴ 
                                                {!! isset($product->disc_price) ? '<span class="old">'. $product->price .'₴</span>' : '' !!}
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
                                </div>
                            </div>
                        </div><!-- Product Item End -->
                    @endforeach
                    
                </div><!-- Product Slider 4 Column Start-->
                
            </div>
            
        </div>
    </div><!-- Product Section End -->

        <!-- Banner Section Start -->
    <div class="banner-section section pb-90 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
        <div class="container">
            
            <div class="row">
                <div class="col-12">
                    <div class="banner"><a href="#"><img src="{{ asset('images/banner/banner-1.jpg') }}" alt=""></a></div>
                </div>
            </div>
            
        </div>
    </div><!-- Banner Section End -->

      <!-- Subscribe Section Start -->
    <div class="subscribe-section section position-relative pt-70 pb-70 pt-md-60 pb-md-60 pt-sm-50 pb-sm-50 pt-xs-50 pb-xs-50 fix">
        <div class="container">
            <div class="row align-items-center">
                
                <div class="col-12">
                    <div class="subscribe-wrap">
                        <h3>Special <span>Offers</span> for Subscription</h3>
                        <h1>GET INSTANT DISCOUNT FOR MEMBERSHIP</h1>
                        <p>Subscribe our newsletter and get all latest news abot our latest <br> products, promotions, offers and discount</p>
                        
                        <form id="mc-form" class="mc-form subscribe-form" >
                            <input id="mc-email" type="email" autocomplete="off" placeholder="Enter your email here" />
                            <button id="mc-submit">submit</button>
                        </form>
                        <!-- mailchimp-alerts Start -->
                        <div class="mailchimp-alerts text-centre">
                            <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                            <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                            <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                        </div><!-- mailchimp-alerts end -->
                    </div>
                </div>
                
            </div>
        </div>
    </div><!-- Subscribe Section End -->

       <!-- Product Section Start -->
    <div class="product-section section pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20">
        <div class="container">
           
            <!-- Section Title Start -->
            <div class="row">
                <div class="col">
                    <div class="section-title left mb-60 mb-xs-40">
                        <h1>Популярные товары</h1>
                        <p>Некоторые из наших клиентов говорят, что они доверяют нам и покупают наши товары без каких-либо сомнений, потому что они верят нам и всегда рады купить наши товары.</p>
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
                                @php $img = json_decode($product->img); @endphp
                                <!-- Image -->
                                <a href="/product/{{ $product->slug }}" class="image"><img src="{{ Voyager::image($img[0]) }}" alt=""></a>
                                <!-- Product Action -->
                                <div class="product-action">
                                    <a data-id="{{ $product->id }}" href="javascript:void(0)" class="cart"><span></span></a>
                                    <a href="#" class="quickview"><span></span></a>
                                </div>
                            </div>
                            <!-- Content -->
                            <div class="product-content">
                                <div class="head">
                                    <!-- Title -->
                                    <div class="top">
                                        <h4 class="title"><a href="/product/{{ $product->slug }}">{{ $product->title }}</a></h4>
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
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-5.png') }}" alt=""></div>
                    <div class="brand-item col"><img src="{{ asset('images/brands/brand-5.png') }}" alt=""></div>
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
    </div><!-- Service Section End -->
@endsection
