import 'package:flutter/material.dart';
import 'package:smart_watches_shop/models/cart_item.dart';
import 'package:smart_watches_shop/models/watch_models.dart';

class CartProvider extends ChangeNotifier {

  final Map<String, CartItemModel> _items = {};

  List<CartItemModel> get items => _items.values.toList();

  int get itemCount => _items.length;

  int get totalQuantity =>
      _items.values.fold(0, (sum, item) => sum + item!.quantity);

  double get totalPrice =>
      _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addToCart(WatchModel watch) {
    if (_items.containsKey(watch.id)) {
      _items[watch.id]!.quantity++;
    } else {
      _items[watch.id] = CartItemModel(watch: watch);
    }
    notifyListeners(); 
  }

  void removeOneFromCart(String watchId) {
    if (!_items.containsKey(watchId)) return;

    if (_items[watchId]!.quantity > 1) {
      _items[watchId]!.quantity--;
    } else {
      _items.remove(watchId);
    }
    notifyListeners();
  }

  void removeFromCart(String watchId) {
    _items.remove(watchId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(String watchId) => _items.containsKey(watchId);
}