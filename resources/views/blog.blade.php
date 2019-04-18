@extends('layouts.app')
@php $carbon = new Carbon\Carbon(); @endphp
@section('banner')
    <div class="page-banner-section section">
        <div class="container">
            <div class="row">
                <div class="col">                    
                    <div class="page-banner text-center">
                        <h1>Блог</h1>
                        <ul class="page-breadcrumb">
                            <li><a href="/">Главная</a></li>
                            <li>Блог</li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
@endsection
@section('content')
<!-- Blog Section Start -->
    <div class="blog-section section pt-90 pb-90 pt-lg-80 pb-lg-80 pt-md-70 pb-md-70 pt-sm-60 pb-sm-60 pt-xs-50 pb-xs-50">
        <div class="container">
           
            <div class="row">
                @foreach($posts as $post)
                    <div class="col-lg-6 col-12 mb-30">
                        <div class="blog-item">
                            <a class="image" href="/blog/{{ $post->slug }}" style="background-image: url({{ Voyager::image($post->image) }})"><img src="{{ Voyager::image($post->image) }}" alt=""></a>
                            <div class="content">
                                <h3 class="title"><a href="/blog/{{ $post->slug }}">{{ $post->title }}</a></h3>
                                <ul class="blog-meta">
                                    <li>{{ $carbon->parse($post->created_at)->formatlocalized('%d %B, %Y') }}</li>
                                </ul>
                                <p>{{ $post->excerpt }}</p>
                                <a href="/blog/{{ $post->slug }}" class="read-more">читать дальше</a>
                            </div>
                        </div>
                    </div>
                @endforeach

            <div class="row mt-10">
                <div class="col">

                    <ul class="page-pagination">
                        <li><a href="#"><i class="fa fa-angle-left"></i>Back</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li>-----</li>
                        <li><a href="#">18</a></li>
                        <li><a href="#">19</a></li>
                        <li><a href="#">20</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i>Next</a></li>
                    </ul>

                </div>
            </div>
            
        </div>
    </div><!-- Blog Section End -->
    
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
    </div><!-- Service Section End -->
@endsection