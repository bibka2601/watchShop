import 'package:flutter/material.dart';
import 'package:smart_watches_shop/provider/watch.dart';

// ignore: must_be_immutable
class WatchTile extends StatelessWidget {
  WatchTile({
    super.key, 
    required this.watch,
    required this.onPressed,
    required this.icon,
  });

  final Watch watch;
  void Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: ListTile(
        title: Text(
          watch.title,
        ),
        subtitle: Text(
          watch.price,
        ),
        leading: Image.asset(
          watch.image,
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}