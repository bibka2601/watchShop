import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationWidget extends StatelessWidget {
  NotificationWidget({
    super.key, 
    required this.leading, 
    required this.title,
    required this.onPressed,
  });

  final String leading;
  final String title;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset(
                leading,
                width: 50,
                height: 50,
               ),
               SizedBox(
                width: 10,
               ),
                Expanded(
                  child: Text(
                    title,                  
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
