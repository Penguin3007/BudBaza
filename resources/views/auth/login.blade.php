@extends('layouts.app')
@section('banner')
<div class="page-banner-section section">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="page-banner text-center">
					<h1>Авторизация</h1>
					<ul class="page-breadcrumb">
						<li><a href="/">Главная</a></li>
						<li>Авторизация</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('content')
<div class="login-register-section section position-relative pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20 fix">
	<div class="container">
		<div class="row">
			<!-- Login Form Start -->
			<div class="col-lg-4 col-md-6 col-12 mr-auto mb-30">
				<div class="login-register-form">
					<h3>Уже зарегестрированы?</h3>
					<form class="login-form" method="POST" action="{{ route('login') }}">
						@csrf
						<div class="row">
							<div class="col-12 mb-20">
								<input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" placeholder="E-mail" value="{{ old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
							</div>
							<div class="col-12 mb-20">
								<input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="Password" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
							</div>
							<div class="col-12 mb-20">
								<div class="check-box">
									<input type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
									<label for="remember">Запомнить меня</label>
								</div>								
							</div>
							<div class="col-12">
								<button class="btn btn-round btn-lg">Войти</button>
								@if (Route::has('password.request'))
                                    <a style="margin-left: 5%;" href="{{ route('password.request') }}">
                                        Забыли пароль?
                                    </a>
                                @endif
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- Login Form End -->

			<!-- Register Form Start -->
			<div class="col-lg-7 col-md-6 col-12 mb-30">
				<div class="login-register-form">
					<h3>Зарегистрироваться</h3>
					<form method="POST" action="{{ route('register') }}">
						@csrf
						<div class="row">
							<div class="col-lg-6 col-12 mb-20">
								<input id="reg_name" type="text" class="form-control{{ $errors->has('reg_name') ? ' is-invalid' : '' }}" name="reg_name" value="{{ old('reg_name') }}" placeholder="Имя" required autofocus>

                                @if ($errors->has('reg_name'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('reg_name') }}</strong>
                                    </span>
                                @endif
							</div>
							<div class="col-lg-6 col-12 mb-20">
								<input id="reg_lname" type="text" class="form-control{{ $errors->has('reg_lname') ? ' is-invalid' : '' }}" name="reg_lname" value="{{ old('reg_lname') }}" placeholder="Фамилия" required autofocus>

                                @if ($errors->has('reg_lname'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('reg_lname') }}</strong>
                                    </span>
                                @endif
							</div>
							<div class="col-lg-12 col-12 mb-20">
								<input id="reg_email" type="email" class="form-control{{ $errors->has('reg_email') ? ' is-invalid' : '' }}" name="reg_email" placeholder="E-mail" value="{{ old('reg_email') }}" required>

                                @if ($errors->has('reg_email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('reg_email') }}</strong>
                                    </span>
                                @endif
							</div>
							<div class="col-lg-6 col-12 mb-20">
								<input id="reg_password" type="password" class="form-control{{ $errors->has('reg_password') ? ' is-invalid' : '' }}" placeholder="Пароль" name="reg_password" required>

                                @if ($errors->has('reg_password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('reg_password') }}</strong>
                                    </span>
                                @endif
							</div>
							<div class="col-lg-6 col-12 mb-20">
								<input id="reg_password-confirm" type="password" class="form-control" name="reg_password_confirmation" placeholder="Пароль еще раз" required>
							</div>
							<div class="col-12">
								<button class="btn btn-round btn-lg" type="submit">Регистрация</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- Register Form End -->
		</div>
	</div>
</div>
@endsection
