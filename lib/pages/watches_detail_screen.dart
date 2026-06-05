import 'package:flutter/material.dart';

/// WatchesWidget — карточка товара в сетке.
/// 
/// Принимает данные снаружи (через конструктор) и отображает их.
/// Сам ничего не знает про корзину — просто вызывает onAddToCart
/// когда нажали кнопку. ЧТО делать — решает MainScreen.
/// Это называется "разделение ответственности".

class WatchesWidget extends StatelessWidget {
  final String image;
  final Color containerBgColor;
  final String watchModel;
  final String watchCompany;
  final String price;
  final bool isInCart;        // уже в корзине?
  final VoidCallback onPressed;    // открыть детали
  final VoidCallback onAddToCart;  // добавить в корзину

  const WatchesWidget({
    super.key,
    required this.image,
    required this.containerBgColor,
    required this.watchModel,
    required this.watchCompany,
    required this.price,
    required this.isInCart,
    required this.onPressed,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: containerBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Картинка товара
            Expanded(
              child: Center(
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    watchModel,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    watchCompany,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Цена + кнопка добавления в корзину
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: onAddToCart,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isInCart ? Colors.green : Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isInCart ? Icons.check : Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}