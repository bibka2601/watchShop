import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/home_page.dart';
import 'package:smart_watches_shop/pages/entering/verify.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void _validateForgotPassword() {
    setState(() {
      if (forgotPasswordController.text.isEmpty) {
        errorText = 'Введите номер';
      } else {
        errorText = null;
      }
    });
    setState(() {
      if (errorText == null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HomePage()));
    }
    });
  }

  TextEditingController forgotPasswordController = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Сброс паролья',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(AppImages.forgot, width: 245, height: 255),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'Забыли пароль?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                'Don’t worry! it happens. Please enter phone number associated with your account',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Мобильный номер',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (value) {
                setState(() {
                  if(value.isEmpty) {
                    errorText = 'Введите номер телефона';
                  } else {
                    errorText = null;
                  }
                });
              },
              controller: forgotPasswordController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorText: errorText,
                hintText: 'номер телефона',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Verify()));
                },
                child: Text(
                  'Сбросить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
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
