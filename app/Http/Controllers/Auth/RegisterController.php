<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/account';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $messages = [
            'reg_name.required'     => 'Имя является обязательным.',
            'reg_lname.required'    => 'Фамилия является обязательной.',
            'reg_name.max'          => 'Имя не может быть больше :max символов',
            'reg_lname.max'         => 'Фамилия не может быть больше :max символов',
            'reg_email.max'         => 'E-mail не может быть больше :max символов',
            'reg_password.min'      => 'Пароль не может быть меньше :min символов',
            'email'                 => 'Поле должно быть E-mail',
            'string'                => 'Поле должно быть строкой',
            'confirmed'             => 'Пароли не совпадают',
            'unique'                => 'Пользователь с таки E-mail уже существует'
        ];
        return Validator::make($data, [
            'reg_name'      => ['required', 'string', 'max:255'],
            'reg_lname'     => ['required', 'string', 'max:255'],
            'reg_email'     => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
            'reg_password'  => ['required', 'string', 'min:6', 'confirmed'],
        ], $messages);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        return User::create([
            'name'      => $data['reg_name'],
            'lname'     => $data['reg_lname'],
            'email'     => $data['reg_email'],
            'password'  => Hash::make($data['reg_password']),
        ]);
    }
}
