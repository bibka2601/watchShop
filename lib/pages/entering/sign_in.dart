import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/home_page.dart';
import 'package:smart_watches_shop/pages/entering/forgot_password.dart';
import 'package:smart_watches_shop/pages/entering/register.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool obscureText = true;
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? phoneError;
  String? passwordError;

  void _validate() {
    setState(() {
      if (numberController.text.isEmpty) {
        phoneError = 'Введите номер телефона';
      } else if (numberController.text.length < 10) {
        phoneError = 'Номер должен содержать 10 цифр';
      } else {
        phoneError = null;
      }

      if (passwordController.text.isEmpty) {
        passwordError = 'Введите пароль';
      } else if (passwordController.text.length < 8) {
        passwordError = 'Минимум 8 символов';
      } else {
        passwordError = null;
      }
    });

    if (phoneError == null && passwordError == null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Войти',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              'Введите ваш мобильный номер',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    phoneError = 'Введите номер телефона';
                  } else if (value.length < 10) {
                    phoneError = 'Номер должен содержать 10 цифр';
                  } else {
                    phoneError = null;
                  }
                });
              },
              decoration: InputDecoration(
                prefixText: '+7 ',
                hintText: 'Ваш номер',
                errorText: phoneError,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Введите пароль',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: obscureText,
              obscuringCharacter: '*',
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    passwordError = 'Введите пароль';
                  } else if (value.length < 6) {
                    passwordError = 'Минимум 6 символов';
                  } else {
                    passwordError = null;
                  }
                });
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  iconSize: 25,
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                hintText: 'Ваш пароль',
                errorText: passwordError,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Забыли пароль?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: _validate,
                child: Text(
                  'Войти',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Нет аккаунта?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text(
                    'Зарегестрироваться',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'или',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.google, width: 32, height: 32),
                    SizedBox(width: 10),
                    Text('Continue with Google'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.apple, width: 32, height: 32),
                    SizedBox(width: 10),
                    Text('Continue with Apple'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'или',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text(
                  'Продолжить как гость',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}