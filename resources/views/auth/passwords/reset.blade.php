@extends('layouts.app')
@section('banner')
<div class="page-banner-section section">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="page-banner text-center">
                    <h1>Восстановление пароля</h1>
                    <ul class="page-breadcrumb">
                        <li><a href="/">Главная</a></li>
                        <li>Восстановление пароля</li>
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
            <div class="col-4 mr-auto mb-30">
                <div class="login-register-form">
                    <h3>Восстановление пароля</h3>
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            Ссылка на восстановление отправлена!
                        </div>
                    @endif
                    <form method="POST" action="{{ route('password.update') }}">
                        @csrf
                        <input type="hidden" name="token" value="{{ $token }}">
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
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" placeholder="Пароль" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="col-12 mb-20">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" placeholder="Пароль еще раз" required>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-round btn-lg">Восстановить</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Login Form End -->
        </div>
    </div>
</div>
@endsection
