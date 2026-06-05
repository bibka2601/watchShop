import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/models/cart_provider.dart';
import 'package:smart_watches_shop/models/watch_models.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  int _valueColor = 0;
  bool _isFavorite = false;

  final List<String> changeColor = ['Red', 'Black', 'White'];

  /// Данные этих часов — берём из нашей модели
  static const _watch = WatchModel(
    id: 'apple_watch_1',
    image: AppImages.watch2,
    containerBgColor: AppColors.thirdColor,
    watchModel: 'Apple Watch Se NewGen',
    watchCompany: 'Apple',
    price: 349.99,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _isFavorite = !_isFavorite);
            },
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: _isFavorite ? AppColors.sixthColor : AppColors.thirdColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.watch2,
              width: 319,
              height: 319,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Apple Watch Se NewGen',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text('5.0'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '(With solo loop)',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Colors',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: changeColor.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ChoiceChip(
                              selectedColor: AppColors.thirdColor,
                              labelStyle:
                                  const TextStyle(color: AppColors.black),
                              label: Text(changeColor[index]),
                              selected: _valueColor == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _valueColor = selected ? index : 0;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          'The aluminium case is lightweight and made from '
                          '100 percent recycled aerospace grade alloy',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// Кнопка "Добавить в корзину"
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.firstColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  /// Добавляем в наш CartProvider
                  context.read<CartProvider>().addToCart(_watch);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Apple Watch добавлен в корзину'),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Добавить в корзину',
                      style: TextStyle(color: AppColors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.shopping_bag, size: 22, color: AppColors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}