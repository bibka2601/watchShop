import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';
import 'package:smart_watches_shop/models/cart_item.dart';
import 'package:smart_watches_shop/models/cart_provider.dart';

/// CartScreen — экран корзины.
/// 
/// Показывает список товаров, количество, итог и кнопку оплаты.
/// Все данные берёт из CartProvider.

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Корзина',
          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          if (cart.items.isNotEmpty)
            TextButton(
              onPressed: () => cart.clearCart(),
              child: const Text('Очистить', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
      backgroundColor: Colors.white,
      body: cart.items.isEmpty
          ? const _EmptyCart()
          : Column(
              children: [
                /// Список товаров в корзине
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return _CartItemTile(item: cart.items[index]);
                    },
                  ),
                ),

                /// Итог и кнопка оплаты
                _CheckoutSection(cart: cart),
              ],
            ),
    );
  }
}

/// Виджет одного элемента корзины
class _CartItemTile extends StatelessWidget {
  final CartItemModel item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartProvider>();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: item.watch.containerBgColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: item.watch.containerBgColor, width: 1.5),
      ),
      child: Row(
        children: [
          /// Картинка
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: item.watch.containerBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(item.watch.image, fit: BoxFit.contain),
          ),

          const SizedBox(width: 12),

          /// Название и цена
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.watch.watchModel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  item.watch.watchCompany,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          /// Кнопки количества
          Column(
            children: [
              /// Удалить полностью
              GestureDetector(
                onTap: () => cart.removeFromCart(item.watch.id),
                child: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _QtyButton(
                    icon: Icons.remove,
                    onTap: () => cart.removeOneFromCart(item.watch.id),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _QtyButton(
                    icon: Icons.add,
                    onTap: () => cart.addToCart(item.watch),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Маленькая кнопка +/-
class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

/// Секция итога и оплаты
class _CheckoutSection extends StatelessWidget {
  final CartProvider cart;

  const _CheckoutSection({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Товаров:', style: TextStyle(fontSize: 16)),
              Text(
                '${cart.totalQuantity} шт.',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Итого:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${cart.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Кнопка оплаты
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () => _showPaymentDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Оплатить',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Диалог подтверждения оплаты
  void _showPaymentDialog(BuildContext context) {
    final cart = context.read<CartProvider>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Подтверждение оплаты',
          style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
        ),
        content: Text(
          'К оплате: \$${cart.totalPrice.toStringAsFixed(2)}\n'
          'Товаров: ${cart.totalQuantity} шт.\n\n'
          'Подтвердить заказ?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              cart.clearCart();           // очищаем корзину
              Navigator.pop(ctx);         // закрываем диалог
              Navigator.pop(context);     // возвращаемся на главную
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('✅ Заказ оформлен! Спасибо за покупку.'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Оплатить', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

/// Пустая корзина
class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.black26),
          SizedBox(height: 16),
          Text(
            'Корзина пуста',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Добавьте часы из каталога',
            style: TextStyle(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}