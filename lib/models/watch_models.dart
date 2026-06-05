// МОДЕЛЬ ТОВАРА
// Это просто класс-описание часов.
// Как бланк: у каждых часов есть id, название, фото, цена и т.д.
// Когда хочешь сделать телефоны — просто меняешь поля.

import 'dart:ui';

class WatchModel {
  final String id;           // уникальный ключ товара
  final String image;        // путь к картинке
  final String watchModel;   // название модели
  final String watchCompany; // бренд
  final double price;        // цена (число, не строка — чтобы считать итог)
  final Color containerBgColor; // цвет карточки

  const WatchModel({
    required this.id,
    required this.image,
    required this.watchModel,
    required this.watchCompany,
    required this.price,
    required this.containerBgColor,
  });
}