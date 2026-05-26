import 'package:flutter/material.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/pages/widgets/notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final List<Widget> notificationList = [
    NotificationWidget(
      leading: AppImages.watch1, 
      title: 'Добро пожаловать в SmartShop!', 
      onPressed: () {},
    ),NotificationWidget(
      leading: AppImages.watch2, 
      title: 'Включите Уведомления и будьте в курсе всех акции и скидок!!', 
      onPressed: () {},
    ),
    NotificationWidget(
      leading: AppImages.watch3, 
      title: 'Дарим купон на 5000 тенге за подписку в инсте!', 
      onPressed: () {},
    ),
    NotificationWidget(
      leading: AppImages.watch4, 
      title: 'Только сегодня скидка 50% на все товары', 
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Уведомления',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: notificationList.length,
                itemBuilder: (context, index) => notificationList[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}