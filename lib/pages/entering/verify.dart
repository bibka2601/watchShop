import 'package:flutter/material.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/home_page.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Подтверждение сброса',
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
              child: Image.asset(
                AppImages.verify,
                width: 245,
                height: 255,
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                'Введите код из смс',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '4-х значный код',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '+7 705 211 72 09',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 300,
                  child: GridView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      
                    ), 
                    itemBuilder:(context, index) => Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                       
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
             SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }, 
                child: Text(
                  'Подтверждение сброса',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Повторная возможность через',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '(00:12)',
                    style: TextStyle(
                      // color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}