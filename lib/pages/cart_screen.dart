import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/pages/tile/watch_tile.dart';
import 'package:smart_watches_shop/pages/widgets/watches_widget.dart';
import 'package:smart_watches_shop/provider/shopping_cart_provider.dart';
import 'package:smart_watches_shop/provider/watch.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //REMOVE ITEM FROM CART
  void removeItemFromCart(Watch watch) {
    Provider.of<ShoppingCartprovider>(
      context,
      listen: false,
    ).removeItemFromCart(watch);
  }

  //PAY BUTTON
  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartprovider>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    //Get individual CART ITEMS
                    Watch eachWatch = value.userCart[index];

                    //RETURN COFFEE TILE
                    return WatchTile(
                      watch: eachWatch, 
                      onPressed: () {}, 
                      icon: Icon(Icons.abc)
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
