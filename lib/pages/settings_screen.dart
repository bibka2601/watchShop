import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/core/constants/app_icons.dart';
import 'package:smart_watches_shop/pages/widgets/settings_screen_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  List<SettingsListTile> get settingsListTiles => [
    SettingsListTile(
      title: 'Notification', 
      leading: Image.asset(AppIcons.notification),
      rightButton: CupertinoSwitch(
          // This bool value toggles the switch.
          value: switchValue,
          activeTrackColor: CupertinoColors.activeBlue,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              switchValue = value;
            });
          },
        ), onPressed: () {
        },
    ),
    SettingsListTile(
      title: 'Dark Mode', 
      leading: Image.asset(AppIcons.dark_mode),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Rate App', 
      leading: Image.asset(AppIcons.star),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Share App', 
      leading: Image.asset(AppIcons.share),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Privacy Policy', 
      leading: Image.asset(AppIcons.privacy),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Terms And Conditions', 
      leading: Image.asset(AppIcons.termsAndPolice),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Cookies Policy', 
      leading: Image.asset(AppIcons.cookies),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Contact', 
      leading:Image.asset(AppIcons.message),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Feedback', 
      leading: Image.asset(AppIcons.feedback),
      onPressed: () {},
    ),
    SettingsListTile(
      title: 'Logout', 
      leading: Image.asset(AppIcons.logout),
      onPressed: () {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Text(
                    'Вы точно хотите выйти из аккаунта?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                     TextButton(
                      onPressed: () {}, 
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ) 
        );
      },
    ),
  ];

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    //   context.watch<ThemeProvider>().getBgColor;
    // context.watch<ThemeProvider>().getAppBarBgColor;
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Container(
                width: 350,
                height: 155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 4, spreadRadius: 0)],
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(AppImages.avatar),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Anastasiya Fedorova',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'nastya@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: settingsListTiles.length,
                itemBuilder: (context, index) => settingsListTiles[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


