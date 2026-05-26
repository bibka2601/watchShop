import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/home_page.dart';
import 'package:smart_watches_shop/pages/entering/sign_in.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscureText = false;
  TextEditingController registerNumberController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();

  String? registerPhoneError;
  String? registerPasswordError;

  void _registerValidate() {
    setState(() {
      if (registerNumberController.text.isEmpty) {
        registerPhoneError = 'Введите данные';
      } else if (registerNumberController.text.length < 10) {
        registerPhoneError = 'Номер должен содержать 10 цифр';
      } else {
        registerPhoneError = null;
      }

      if (registerPasswordController.text.isEmpty) {
        registerPasswordError = 'Введите пароль';
      } else if (registerPasswordController.text.length < 10) {
        registerPasswordError = 'Минимум 10 символов';
      }
    });
    if (registerPhoneError == null && registerPasswordError == null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HomePage()));
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
          'Зарегистироваться',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Text(
              'Мобильный номер',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              
              controller: registerNumberController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    registerPhoneError = 'Введите номер телефона';
                  } else if (value.length < 10) {
                    registerPhoneError = 'Номер должен содержать 10 цифр';
                  } else {
                    registerPhoneError = null;
                  }
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixText: '+7 ',
                errorText: registerPhoneError,
                hintText: 'мобильный номер',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Придумайте пароль',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      registerPasswordError = 'Введите пароль';
                    } else if (value.length < 6) {
                      registerPasswordError = 'Минимум 6 символов';
                    } else {
                      registerPasswordError = null;
                    }
                  });
                },
                controller: registerPasswordController,
                obscureText: obscureText,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  errorText: registerPasswordError,
                  hintText: 'ваш пароль',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffix: IconButton(
                    iconSize: 25,
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => SignIn()));
                },
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
                  'Вы уже ранее имели аккаунт?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'или',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(height: 15),
            Container(
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
            SizedBox(height: 10),
            Container(
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
          ],
        ),
      ),
    );
  }
}
