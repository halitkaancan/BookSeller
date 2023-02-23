import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/best_seller/view/best_seller.dart';
import 'package:mobileapp/feature/home/viewmodel/home_viewmodel.dart';
import '../../../product/component/general_color.dart';
import '../../../product/component/search_bar.dart';
import '../../../product/text_style/text_style.dart';
import '../../best_seller/model/model_best_seller.dart';
import '../model/model_category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.token});
  final String token;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  int _selectedIndex = -1;
  bool _isLoading = false;

  List<CategoryModel>? categoriesList = [];
  List<BestSellerModel>? productList = [];

  final List<String> BookTypes = [
    'All',
    'Classic',
    'Horror',
    'Romance',
    'Sci-Fi'
  ];
  List<bool> _pressedList = [false, false, false, false, false];

  String _getButtonName(int index) {
    return '${BookTypes[index]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20).h,
          child: SizedBox(
            width: 50.w,
            height: 32.h,
            child: SvgPicture.asset('assets/logo.svg'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 30,
            ).h,
            child: Text(
              'Catalog',
              style: CustomTextStyle.generalButtonTextStyleBlueMagentaBlack20,
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.only(
                left: 20.w,
              ),
              child: Column(children: [
                SizedBox(
                    width: double.infinity,
                    height: 42.h,
                    child: BookTypesButton()),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SearchBar(),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Column(
                      children: [
                        Expanded(child: categoryNameWidget()),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
    );
  }

  ListView categoryNameWidget() {
    return ListView.builder(
      itemCount: resourceCategory.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  resourceCategory[index].name ?? "",
                  style: CustomTextStyle.generalButtonTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BestSellerPage(
                                  token: widget.token,
                                  title: resourceCategory[index].name ?? "",
                                  list: resourceProductHome[index],
                                )));
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorCinnabar(),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 370.w,
                  height: 140.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: resourceProductHome[index].length,
                    itemBuilder: (context, index1) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 80.w,
                                  height: 120.h,
                                  child: Image.network(
                                      resourceProductHome[index][index1]
                                              .cover ??
                                          "")),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Column(
                                  children: [
                                    Text(
                                      //
                                      resourceProductHome[index][index1].name ??
                                          "",
                                      style: CustomTextStyle
                                          .generalButtonTextStyle12,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      resourceProductHome[index][index1]
                                              .author ??
                                          "",
                                      style: CustomTextStyle
                                          .generalButtonTextStyle10,
                                    ),
                                    SizedBox(
                                      height: 44.h,
                                    ),
                                    Text(
                                      resourceProductHome[index][index1]
                                          .price
                                          .toString(),
                                      style: CustomTextStyle
                                          .generalButtonTextStyleBlueMagenta16,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  // SizedBox bookCardWidget() {
  //   return SizedBox(
  //     width: 210.w,
  //     height: 140.h,
  //     child: Card(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
  //         child: Row(
  //           children: [
  //             SizedBox(
  //               width: 80.w,
  //               height: 120.h,
  //               child: Image.asset(
  //                 productService.getProductImage(cover: resourceProduct[index].cover!)
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(top: 10.h),
  //               child: Column(
  //                 children: [
  //                   SizedBox(
  //                     height: 4.h,
  //                   ),
  //                   Text(
  //                     "data",
  //                     style: CustomTextStyle.generalButtonTextStyle10,
  //                   ),
  //                   SizedBox(
  //                     height: 44.h,
  //                   ),
  //                   Text(
  //                     "data",
  //                     style:
  //                         CustomTextStyle.generalButtonTextStyleBlueMagenta16,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  ListView BookTypesButton() {
    bool isPressed;
    return ListView.builder(
        itemCount: BookTypes.length,
        itemExtent: 120,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9).w,
            child: ElevatedButton(
              key: ValueKey(_getButtonName(index)),
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    } else {
                      return _selectedIndex == index
                          ? ColorBlueMagenta()
                          : Color(0xFFF4F4FF);
                    }
                  },
                ),
              ),
              child: Text(
                _getButtonName(index),
                style: const TextStyle(
                    color: Colors.black,
                    //color: Color.fromARGB(9, 9, 55, 1), renk böyle olmalı ama gözükmüyor
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          );
        });
  }

  SvgPicture Logo() => SvgPicture.asset('assets/logo.svg');
}
