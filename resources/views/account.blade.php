@extends('layouts.app')
@section('banner')
<div class="page-banner-section section">
	<div class="container">
	 <div class="row">
	 	<div class="col">
	 		<div class="page-banner text-center">
	 			<h1>Личный кабинет</h1>
	 			<ul class="page-breadcrumb">
	 				<li><a href="/">Главная</a></li>
	 				<li>Личный кабинет</li>
	 			</ul>
	 		</div>
	 	</div>
	 </div>
	</div>
</div>
@endsection
@section('content')
<div class="my-account-section section position-relative pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20 fix">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<!-- My Account Tab Menu Start -->
					<div class="col-lg-3 col-12 mb-30">
						<div class="myaccount-tab-menu nav" role="tablist">
							<a href="#dashboad" class="active" data-toggle="tab"><i class="fa fa-dashboard"></i>Личный кабинет</a>
							<a href="#orders" data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>Заказы</a>
							<a href="#account-info" data-toggle="tab"><i class="fa fa-user"></i>Личные данные</a>
							<a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="fa fa-sign-out"></i> Выйти</a>
						</div>
					</div>
					<!-- My Account Tab Menu End -->
					<!-- My Account Tab Content Start -->
					<div class="col-lg-9 col-12 mb-30">
						<div class="tab-content" id="myaccountContent">
							<!-- Single Tab Content Start -->
							<div class="tab-pane fade show active" id="dashboad" role="tabpanel">
								<div class="myaccount-content">
									<h3>Консоль</h3>
									<div class="welcome">
										<p>Привет, <strong>{{ \Auth::user()->name }}</strong> (Если Вы не <strong>{{ \Auth::user()->name }} </strong> <a href="{{ route('logout') }}" class="logout" onclick="event.preventDefault();document.getElementById('logout-form').submit();"> Выйти</a>)</p>
									</div>
									<p class="mb-0">В консоли вашего аккаунта вы можете просматривать Ваши заказы, изменить пароль и профиль.</p>
								</div>
							</div>
							<!-- Single Tab Content End -->

							<!-- Single Tab Content Start -->
							<div class="tab-pane fade" id="orders" role="tabpanel">
								<div class="myaccount-content">
									<h3>Заказы</h3>
									<div class="myaccount-table table-responsive text-center">
										<table class="table table-bordered">
											<thead class="thead-light">
												<tr>
													<th>Номер заказа</th>
                                                    <th>Количество товара</th>
                                                    <th>Дата</th>
                                                    <th>Статус</th>
                                                    <th>Всего</th>
                                                    <th>Просмотреть</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<tr>
                                            		<td>1</td>
                                            		<td>1</td>
                                            		<td>Aug 22, 2018</td>
                                            		<td>Pending</td>
                                                    <td>$45</td>
                                                    <td><a href="cart.html" class="btn btn-round">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Katopeno Altuni</td>
                                                    <td>July 22, 2018</td>
                                                    <td>Approved</td>
                                                    <td>$100</td>
                                                    <td><a href="cart.html" class="btn btn-round">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Murikhete Paris</td>
                                                    <td>June 12, 2017</td>
                                                    <td>On Hold</td>
                                                    <td>$99</td>
                                                    <td><a href="cart.html" class="btn btn-round">View</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Tab Content End -->

                            <!-- Single Tab Content Start -->
                            <div class="tab-pane fade" id="account-info" role="tabpanel">
                            	<div class="myaccount-content">
                            		<div class="row">
	                            		<div class="col-6">
	                            			<h3>Личные данные</h3>
	                            		</div>
	                            		<div class="col-6">
	                            			<h3>Смена пароля</h3>
	                            		</div>
	                            	</div>
                            		<div class="account-details-form">
                            			<div class="row">
                            				<form style="padding-left: 0px;" class="col-6" action="#">
                            					@csrf
	                            				<div class="col-12 mb-30">
	                            					<input id="first-name" name="fname" value="{{ \Auth::user()->name }}" placeholder="Имя" type="text">
	                            				</div>
	                            				<div class="col-12 mb-30">
	                            					<input id="last-name" placeholder="Фамилия" name="lname" value="{{ \Auth::user()->lname }}" type="text">
	                            				</div>
	                            				<div class="col-12 mb-30">
	                            					<input id="email" placeholder="Email" name="email" value="{{ \Auth::user()->email }}" type="email">
	                            				</div>
	                            				<div class="col-12">
	                            					<button type="submit" class="btn btn-round btn-lg">Сохранить</button>
	                            				</div>
	                            			</form>
	                            			<form style="padding-left: 0px;" class="col-6" action="#">
	                            				@csrf
	                            				<div class="col-12 mb-30">
	                            					<input id="current-pwd" placeholder="Текущий пароль" type="password">
	                            				</div>
	                            				<div class="col-12 mb-30">
	                            					<input id="new-pwd" placeholder="Новый пароль" type="password">
	                            				</div>
	                            				<div class="col-12 mb-30">
	                            					<input id="confirm-pwd" placeholder="Новый пароль еще раз" type="password">
	                            				</div>
	                            				<div class="col-12">
	                            					<button type="submit" class="btn btn-round btn-lg">Сохранить</button>
	                            				</div>
	                            			</form>
                            			</div>
                            		</div>
                            	</div>
                            </div>
                            <!-- Single Tab Content End -->
                        </div>
                    </div>
                    <!-- My Account Tab Content End -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- My Account Section End -->

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
</div>
<!-- Brand Section End -->

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