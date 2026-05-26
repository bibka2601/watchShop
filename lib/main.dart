import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watches_shop/pages/entering/sign_in.dart';
import 'package:smart_watches_shop/provider/shopping_cart_provider.dart';

void main() {
  runApp(SmartWatchesShop());
}

class SmartWatchesShop extends StatelessWidget {
  const SmartWatchesShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShoppingCartprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}