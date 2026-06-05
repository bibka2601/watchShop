import 'package:flutter/material.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';

// ignore: must_be_immutable
class WatchesWidget extends StatelessWidget {
  WatchesWidget({
    super.key, 
    required this.image, 
    required this.containerBgColor, 
    required this.watchModel, 
    required this.watchCompany, 
    required this.price,
    required this.onPressed, required Null Function() onAddToCart, required bool isInCart,
  });

  final String image;
  final Color containerBgColor;
  final String watchModel;
  final String watchCompany;
  final String price;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: containerBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Image.asset(image),
              ),
            ),
            SizedBox(height: 12),
            Text(
              '$watchModel',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              '$watchCompany',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              '$price',
              style: TextStyle(
                color: AppColors.firstColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
