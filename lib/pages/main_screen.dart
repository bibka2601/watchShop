import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/models/cart_provider.dart';
import 'package:smart_watches_shop/models/watch_models.dart';
import 'package:smart_watches_shop/pages/cart_screen.dart';
import 'package:smart_watches_shop/pages/widgets/watches_widget.dart';
import 'package:smart_watches_shop/wathes_detail_pages/screen1.dart';
import 'package:smart_watches_shop/wathes_detail_pages/screen2.dart';
import 'package:smart_watches_shop/wathes_detail_pages/screen3.dart';
import 'package:smart_watches_shop/wathes_detail_pages/screen4.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? _selectedChip = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<String> chipList = [
    'Smart Watch',
    'Apple',
    'Samsung',
    'Xiaomi',
    'Huawei',
  ];

  /// Каталог часов — список моделей.
  /// 
  /// Раньше это были WatchesWidget прямо здесь — так нельзя,
  /// потому что данные и UI смешаны. Теперь данные отдельно (WatchModel),
  /// виджет отдельно (WatchesWidget). Чисто и понятно.
  /// 
  /// Хочешь добавить часы? Просто добавь WatchModel в этот список.
  static const List<WatchModel> catalog = [
    WatchModel(
      id: 'apple_watch_1',
      image: AppImages.watch2,
      containerBgColor: AppColors.thirdColor,
      watchModel: 'Apple Watch',
      watchCompany: 'Apple',
      price: 349.99,
    ),
    WatchModel(
      id: 'samsung_galaxy_1',
      image: AppImages.watch1,
      containerBgColor: AppColors.sixthColor,
      watchModel: 'Samsung Galaxy',
      watchCompany: 'Samsung',
      price: 249.00,
    ),
    WatchModel(
      id: 'huawei_watch_1',
      image: AppImages.watch3,
      containerBgColor: AppColors.firstColor,
      watchModel: 'Huawei Watch',
      watchCompany: 'Huawei',
      price: 199.99,
    ),
    WatchModel(
      id: 'xiaomi_watch_1',
      image: AppImages.watch4,
      containerBgColor: AppColors.secondColor,
      watchModel: 'Xiaomi Watch',
      watchCompany: 'Xiaomi',
      price: 279.99,
    ),
  ];

  /// Детальные экраны для каждого товара по id
  void _openDetailScreen(String watchId) {
    final routes = {
      'apple_watch_1': () => const Screen1(),
      'samsung_galaxy_1': () => const Screen2(),
      'huawei_watch_1': () => const Screen3(),
      'xiaomi_watch_1': () => const Screen4(),
    };

    final builder = routes[watchId];
    if (builder != null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => builder()));
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// context.watch — следим за корзиной.
    /// Когда CartProvider вызывает notifyListeners() —
    /// этот виджет перерисовывается автоматически.
    final cart = context.watch<CartProvider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            /// Заголовок + иконка корзины
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Find Your suitable watch now.',
                    style: TextStyle(
                      fontSize: 40,
                      color: AppColors.fifthColor,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
                /// Иконка корзины с бейджем (количество товаров)
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart_outlined, size: 28),
                    ),
                    if (cart.totalQuantity > 0)
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${cart.totalQuantity}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// Поиск
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    cursorColor: AppColors.secondColor,
                    cursorHeight: 15,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => _searchController.clear(),
                        icon: const Icon(Icons.cancel_sharp),
                      ),
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.searchIcon, width: 20, height: 20),
                          const SizedBox(width: 10),
                          const Text('Search Product'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: Image.asset(AppImages.filterIcon, width: 20, height: 20),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Чипы фильтрации
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: chipList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    selectedColor: AppColors.firstColor,
                    labelStyle: const TextStyle(color: AppColors.black),
                    label: Text(chipList[index]),
                    selected: _selectedChip == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedChip = selected ? index : null;
                      });
                    },
                  ),
                ),
              ),
            ),

            /// Сетка товаров
            Expanded(
              child: GridView.builder(
                itemCount: catalog.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final watch = catalog[index];
                  return WatchesWidget(
                    image: watch.image,
                    containerBgColor: watch.containerBgColor,
                    watchModel: watch.watchModel,
                    watchCompany: watch.watchCompany,
                    price: '\$${watch.price.toStringAsFixed(2)}',
                    isInCart: cart.isInCart(watch.id),
                    onPressed: () => _openDetailScreen(watch.id),
                    onAddToCart: () {
                      /// context.read — берём провайдер и вызываем метод.
                      /// Используем read (не watch) потому что нам не нужно
                      /// перерисовывать виджет, нам нужно просто вызвать действие.
                      context.read<CartProvider>().addToCart(watch);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${watch.watchModel} добавлен в корзину'),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}