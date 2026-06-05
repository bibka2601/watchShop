import 'package:smart_watches_shop/models/watch_models.dart';

/// CartItemModel — один элемент корзины.
/// 
/// Зачем отдельный класс а не просто WatchModel?
/// Потому что у корзины есть quantity (количество).
/// Один товар можно добавить несколько раз — 
/// лучше хранить quantity чем дублировать товар.

class CartItemModel {
  final WatchModel watch; // сам товар
  int quantity;           // сколько штук

  CartItemModel({
    required this.watch,
    this.quantity = 1,    // по умолчанию 1
  });

  /// Итоговая цена за этот товар (цена × количество)
  double get totalPrice => watch.price * quantity;
}