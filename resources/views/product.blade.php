@extends('layouts.app')

@section('banner')
    <div class="page-banner-section section">
        <div class="container">
            <div class="row">
                <div class="col">
                    
                    <div class="page-banner text-center">
                        <h1>{{ $product->title }}</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="/">Главная</a></li>
                            <li>{{ $product->title }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('content')
<div class="product-section section pt-90 pb-90 pt-lg-80 pb-lg-80 pt-md-70 pb-md-70 pt-sm-60 pb-sm-60 pt-xs-50 pb-xs-50">
        <div class="container">
            <div class="row">

                <div class="col-12">
                   
                    <div class="product-details mb-50">
                        <!-- Image -->
                        <div class="product-image left-thumbnail mb-xs-20">
                            <!-- Image -->
                            <div class="product-slider single-product-slider-syn">
                                @foreach(json_decode($product['img']) as $img)
                                    <div class="item"><img src="{{ Voyager::image($img) }}" alt=""></div>
                                @endforeach
                            </div>
                            <div class="product-slider single-product-thumb-slider-syn" data-vertical="true">
                                @foreach(json_decode($product['img']) as $img)
                                    <div class="item"><img src="{{ Voyager::image($img) }}" alt=""></div>
                                @endforeach
                            </div>
                        </div>
                        <!-- Content -->
                        <div class="product-content">
                            <div class="product-content-inner">
                                <div class="head">
                                    <!-- Title-->
                                    <div class="top">
                                        <h4 class="title">{{ $product->title }}</h4>
                                    </div>
                                    <!-- Price & Ratting -->
                                    <div class="bottom">
                                        <span class="price">{{ $product->price }} ₴</span>
                                        <span class="ratting">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="body">
                                    {!! $product->desc !!}
                                    <div class="quantity">
                                        <h4>Количество:</h4>
                                        <div class="pro-qty single-product"><input type="number" min="1" value="1" max="{{ $product->quanity }}"></div>
                                    </div>

                                    <!-- Product Action -->
                                    <div class="product-action">
                                        @csrf
                                        <a data-id="{{ $product->id }}" href="javascript:void(0)" class="cart single-product add-to-cart"><span></span></a>
                                        <a href="#" class="compare"><span></span></a>
                                        <a href="#" class="wishlist"><span></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <ul class="product-details-tab-list nav">
                        <li><a class="active" data-toggle="tab" href="#description">Описание</a></li>
                        <li><a data-toggle="tab" href="#reviews">Отзывы({{ count($reviews) }})</a></li>
                    </ul>
                    <div class="product-details-tab-content tab-content">
                        <div class="tab-pane active" id="description">
                            {!! $product->desc !!}
                        </div>
                        <div class="tab-pane" id="reviews">
                            <div class="review-list">
                                @foreach($reviews as $review)
                                    <div class="review">
                                        <h4 class="name">{{ $review->name }} <span>9 March 2018</span></h4>
                                        <div class="ratting">
                                            @if($review->rating == 1)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($review->rating == 2)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($review->rating == 3)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($review->rating == 4)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            @elseif($review->rating == 5)
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            @endif
                                        </div>
                                        <div class="desc">
                                            <p>{{ $review->text }}</p>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            <div class="review-form">
                                <h3>Оставьте свой отзыв:</h3>
                                <form action="javascript:void(0)" id="add_review">
                                    <div class="ratting">
                                        <fieldset class="rating">
                                            <input type="radio" id="star5" name="rating" value="5" checked/><label class = "full" for="star5"></label>
                                            <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" ></label>
                                            <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3"></label>
                                            <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2"></label>
                                            <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1"></label>
                                        </fieldset>
                                        {{-- <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i> --}}
                                    </div> 
                                    <div class="row row-10" style="display: inline-flex;">
                                        <input type="hidden" value="{{ $product->slug }}" name="slug">
                                        <div class="col-md-6 col-12 mb-20"><input required type="text" placeholder="Name" name="name"></div>
                                        <div class="col-md-6 col-12 mb-20"><input required type="email" placeholder="Email" name="email"></div>
                                        <div class="col-12 mb-20"><textarea required placeholder="Review" name="text"></textarea></div>
                                        <div class="col-12"><input type="submit" value="Submit"></div>
                                    </div>  
                                </form>
                            </div>   
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
                        <h3>Free home delivery</h3>
                        <p>Provide free home delivery for all product over $100</p>
                    </div>
                </div>
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>Quality Products</h3>
                        <p>We ensure the product quality that is our main goal</p>
                    </div>
                </div>
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>3 Days Return</h3>
                        <p>Return product within 3 days for any product you buy</p>
                    </div>
                </div>
                
                <div class="service col-xl-3 col-md-6 col-12">
                    <div class="icon"></div>
                    <div class="content">
                        <h3>Online Support</h3>
                        <p>We ensure the product quality that you can trust easily</p>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
@endsection