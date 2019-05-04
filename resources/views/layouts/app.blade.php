<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BudBaza - магазин стройматериалов</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('/images/favicon.ico') }}">
    
    <!-- CSS
    ============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ asset('/css/bootstrap.min.css') }}">
    
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="{{ asset('/css/font-awesome.min.css') }}">
    
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="{{ asset('/css/plugins.css') }}">
    
    <!-- Helper CSS -->
    <link rel="stylesheet" href="{{ asset('/css/helper.css') }}">
    
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="{{ asset('/css/style.css') }}">
    
    <!-- Modernizer JS -->
    <script src="{{ asset('/js/vendor/modernizr-2.8.3.min.js') }}"></script>
</head>

<body>
<div class="error">
    <h3 class="error_text">Error!</h3>
</div>
<div class="loaderArea">
    <img class="loader" src="{{ asset('images/ajax.gif') }}" alt="">
</div>

<div class="main-wrapper">

    <!-- Header Section Start -->
    <div class="header-section section bg-white">
        <div class="container">
            <div class="row">
                
                <!-- Header Logo -->
                <div class="col">
                    <div class="header-logo">
                        <a href="/">
                            <img src="{{ Voyager::image(setting('site.logo')) }}" alt="">
                        </a>
                    </div>
                </div>
                
                <!-- Main Menu -->
                <div class="col d-none d-lg-block">
                    <nav class="main-menu">
                        {{ menu('Main menu') }}
                    </nav>
                </div>
                
                <!-- Header Action -->
                <div class="col">
                    <div class="header-action">
                        
                        <!-- Wishlist -->
                        {{-- <a href="wishlist.html" class="header-wishlist"><span class="icon">wishlist</span></a> --}}
                        
                        <!-- Cart Wrap Start-->
                        <div class="header-cart-wrap">
                            <!-- Cart Toggle -->
                            <button class="header-cart-toggle"><span class="icon">cart</span><span class="number">{{ \Cart::count() }}</span><span class="price">{{ \Cart::subtotal() }} ₴</span></button>
                            
                            <!-- Header Mini Cart Start -->
                            <div class="header-mini-cart">
                                <!-- Mini Cart Head -->
                                <div class="mini-cart-head">
                                    <h3>Корзина</h3>
                                </div>
                                <!-- Mini Cart Body -->
                                <div class="mini-cart-body">
                                    <div class="mini-cart-body-inner custom-scroll">
                                        <ul>
                                            @foreach(\Cart::content() as $item)
                                                <!-- Mini Cart Product -->
                                                <li class="mini-cart-product">
                                                    <div class="image">
                                                        <a href="/shop/{{ $item->options->slug }}"><img src="{{ Voyager::image($item->options->img) }}" alt=""></a>
                                                        <a href="/cart/delete/{{ $item->rowId }}" class="remove"><i class="fa fa-trash-o"></i></a>
                                                    </div>
                                                    <div class="content">
                                                        <a href="product-details-variable.html" class="title">{{ $item->name }}</a>
                                                        <span>{{ $item->qty }} x {{ $item->price }} ₴</span>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                                <!-- Mini Cart Footer -->
                                <div class="mini-cart-footer">
                                    <h4>Стоимость: {{ \Cart::subtotal() }} ₴</h4>
                                    <div class="buttons">
                                        <a href="/cart">Корзина</a>
                                        <a href="/checkout">Оформить</a>
                                    </div>
                                </div>
                            </div><!-- Header Mini Cart End -->
                            
                        </div><!-- Cart Wrap End-->
                        <div class="account-wrapper" style="display: flex;">
                            <a style="margin-right: 20%;" title="Личный кабинет" href="/account"><img width="30px" height="30px" src="{{ asset('images/account.png') }}" alt=""></a>
                        </div>
                    </div>
                </div>                
                <div class="col-12 d-block d-lg-none">
                    <div class="mobile-menu"></div>
                </div>
                
            </div>
        </div>
    </div><!-- Header Section End -->
    @yield('banner')
    @yield('content')

    <!-- Footer Top Section Start -->
    <div class="footer-top-section section bg-dark">
        <div class="container">
            <div class="footer-widget-wrap row">
                
                <div class="col mb-40">
                    <div class="footer-widget">
                        <img src="{{ Voyager::image(setting('site.logo')) }}" alt="">
                        <p>Харьков</p>
                        <p><a href="tel:0935876774">093 587 677 4</a></p>
                        <p><a href="mailto:stefaniuk3007@gmail.com">stefaniuk3007@gmail.com</a></p>
                    </div>
                </div>
                
                {{-- <div class="col mb-40">
                    <div class="footer-widget">
                        <h3 class="title">Quick Link</h3>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Features</a></li>
                            <li><a href="#">Shop</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Pages</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div> --}}
                
                {{-- <div class="col mb-40">
                    <div class="footer-widget">
                        <h3 class="title">Information</h3>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Order Tracking</a></li>
                            <li><a href="#">Payment System</a></li>
                            <li><a href="#">Return Policy</a></li>
                            <li><a href="#">Promotional Offers</a></li>
                        </ul>
                    </div>
                </div> --}}
                
                <div class="col mb-40">
                    <div class="footer-widget">
                        <h3 class="title">Подписывайтесь на нас в соц. сетях</h3>
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Instagram</a></li>
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    </div><!-- Footer Top Section End -->
    
    <!-- Footer Bottom Section Start -->
    <div class="footer-bottom-section section">
        <div class="container">
            <div class="row align-items-center">
                
                <div class="copyright col-lg-6 col-12">
                    <p>Copyright &copy; <a href="#">BudBaza</a>, All Rights Reserved</p>
                </div>
                
                <div class="payment-method col-lg-6 col-12">
                    <img src="{{ asset('images/payment-method.png') }}" alt="">
                </div>
                
            </div>
        </div>
    </div><!-- Footer Bottom Section End -->

</div>
<!--Logout form-->
<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
    @csrf
</form>

<!-- JS
============================================ -->

<!-- jQuery JS -->
<script src="{{ asset('/js/vendor/jquery-1.12.4.min.js') }}"></script>
<!-- Popper JS -->
<script src="{{ asset('/js/popper.min.js') }}"></script>
<!-- Bootstrap JS -->
<script src="{{ asset('/js/bootstrap.min.js') }}"></script>
<!-- Plugins JS -->
<script src="{{ asset('/js/plugins.js') }}"></script>
<!-- Main JS -->
<script src="{{ asset('/js/main.js') }}"></script>
<!-- Isotope JS -->
<script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
<!-- AJAX -->
<script src="{{ asset('/js/ajax.js') }}"></script>
</body>

</html>