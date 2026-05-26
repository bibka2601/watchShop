import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsListTile extends StatelessWidget {
  
  SettingsListTile({
    super.key, 
    required this.title, 
    required this.leading, 
    this.rightButton, 
    required this.onPressed,
  });

  final String title;
  final Widget leading;
  final Widget? rightButton;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(title),
        leading: SizedBox(
          width: 30,
          height: 30,
          child: leading,
        ),
        trailing: rightButton,
      ),
    );
  }
}