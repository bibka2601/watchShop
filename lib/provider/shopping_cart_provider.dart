import 'package:flutter/material.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/provider/watch.dart';

class ShoppingCartprovider extends ChangeNotifier{
  final List<Watch> _shop = [
    Watch(
      image: AppImages.watch1, 
      title: 'Apple Watch', 
      model: 'Apple', 
      price: '\$349.99',
    ),
    Watch(
      image: AppImages.watch2, 
      title: 'Samsung Galaxy Watch', 
      model: 'Samsung', 
      price: '\$249.99',
    ),
    Watch(
      image: AppImages.watch3, 
      title: 'Hauwei Watch', 
      model: 'Huawei', 
      price: '\$199.99',
    ),
    Watch(
      image: AppImages.watch4, 
      title: 'Xiaomi Watch', 
      model: 'Xiaomi', 
      price: '\$279.99',
    ),
  ];
  //User Cart
  List<Watch> userCart = [];

  //Get Watch List
  List<Watch> get watchShop => _shop;

  //Get user cart 
  List<Watch> get _userCart => userCart;

  //add item to cart
  void addItemToCart(Watch watch) {
    userCart.add(watch);
    notifyListeners();
  }

  void removeItemFromCart(Watch watch) {
    userCart.remove(watch);
    notifyListeners();
  }
}