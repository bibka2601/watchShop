import 'package:flutter/material.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';
import 'package:smart_watches_shop/pages/watches_detail_screen.dart';
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
  int? _value = 0;

  List<String> chipList = [
    'Smart Watch',
    'Apple',
    'Samsung',
    'Xiaomi',
    'Huawei',
  ];

  List<WatchesWidget> get watchesCatalog => [
    WatchesWidget(
      image: AppImages.watch2,
      containerBgColor: AppColors.thirdColor,
      watchModel: 'Apple Watch',
      watchCompany: 'Apple',
      price: '\$349.99', 
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Screen1(),
          ),
        );
      },
    ),
    WatchesWidget(
      image: AppImages.watch1,
      containerBgColor: AppColors.sixthColor,
      watchModel: 'Samsung Galaxy',
      watchCompany: 'Samsung',
      price: '\$249.00', 
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Screen2(),
          ),
        );
      },
    ),
    WatchesWidget(
      image: AppImages.watch3,
      containerBgColor: AppColors.firstColor,
      watchModel: 'Huawei Watch',
      watchCompany: 'Huawei',
      price: '\$199.99',
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Screen3(),
          ),
        );
      },
    ),
    WatchesWidget(
      image: AppImages.watch4,
      containerBgColor: AppColors.secondColor,
      watchModel: 'Xiaomi Watch',
      watchCompany: 'Xiaomi',
      price: '\$279.99',
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Screen4(),
          ),
        );
      },
    ),
  ];

  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              'Find Your suitable watch now.',
              style: TextStyle(
                fontSize: 40,
                color: AppColors.fifthColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 320,
                  child: TextField(
                    controller: controllerSearch,
                    cursorColor: AppColors.secondColor,
                    cursorHeight: 15,
                    cursorOpacityAnimates: false,
                    // showCursor: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controllerSearch.clear();
                        },
                         icon: Icon(Icons.cancel_sharp)
                      ),
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.searchIcon,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text('Search Product'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.filterIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    selectedColor: AppColors.firstColor,
                    labelStyle: TextStyle(color: AppColors.black),
                    label: Text(chipList[index]),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                  ),
                ),
                itemCount: chipList.length,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: watchesCatalog.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return watchesCatalog[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
