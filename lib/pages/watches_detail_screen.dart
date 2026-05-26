import 'package:flutter/material.dart';
import 'package:smart_watches_shop/core/constants/app_colors.dart';
import 'package:smart_watches_shop/core/constants/app_images.dart';

class WatchesDetailScreen extends StatefulWidget {
  const WatchesDetailScreen({super.key});

  @override
  State<WatchesDetailScreen> createState() => _WatchesDetailScreenState();
}

class _WatchesDetailScreenState extends State<WatchesDetailScreen> {
  int _valueColor = 0;

  final List<String> changeColor = [
    'Red',
    'Black',
    'White',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back, 
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.favorite, 
              size: 30,
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
            SizedBox(height: 25),
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
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apple Watch Se NewGen',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star, 
                                      color: Colors.yellow,
                                    ),
                                    Text('5.0'),
                                  ],
                                ),
                              ),
                            ],
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
                      SizedBox(height: 10),
                      Text(
                        'Colors',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                  selectedColor: AppColors.thirdColor,
                                  labelStyle: TextStyle(color: AppColors.black),
                                  label: Text(
                                    changeColor[index],
                                  ),
                                  selected: _valueColor == index,
                                  onSelected: (bool selectedColor) {
                                    setState(() {
                                    _valueColor = selectedColor ? index : null!;
                                    });
                                  },
                                ),
                              ),
                              itemCount: changeColor.length,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Flexible(
                        child: Text(
                         "The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy",
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
          ],
        ),
      ),
    );
  }
}
