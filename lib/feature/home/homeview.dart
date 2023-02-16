import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/best_seller/view/best_seller.dart';
import 'package:mobileapp/product/component/general_paddin.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../product/component/general_color.dart';
import '../../product/component/search_bar.dart';
import '../../product/model/category_model.dart';
import '../../product/text_style/text_style.dart';
import '../best_seller/model/category_model.dart';
import '../best_seller/service/category_service.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = -1;
  bool _isLoading = false;
  void initState() {
    // getLists();
  }

//_items yerine bunu kullan
  List<GetCategoryModel>? categoriesList = [];

  final List<String> BookTypes = [
    'All',
    'Classic',
    'Horror',
    'Romance',
    'Sci-Fi'
  ];
  List<bool> _pressedList = [false, false, false, false, false];
  final List<String> Category = ["Best Seller", "Classic", "Children"];

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
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
        ),
        child: Column(children: [
          SizedBox(
              width: double.infinity, height: 42.h, child: BookTypesButton()),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: SearchBar(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 20.w, top: 40.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // CategoryName(),
                    BooksCategory(),
                    // CategoryName(),
                    BooksCategory(),
                    // CategoryName(),
                    BooksCategory(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

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

class CategoryName extends StatelessWidget {
  const CategoryName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: resource.lenght,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              resource[index].name ?? "",
              style: CustomTextStyle.generalButtonTextStyle,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BestSellerPage()));
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
        );
      },
    );
  }
}

class BooksCategory extends StatelessWidget {
  const BooksCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BookCards(),
          BookCards(),
        ],
      ),
    );
  }
}

class BookCards extends StatelessWidget {
  const BookCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210.w,
      height: 140.h,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            children: [
              SizedBox(
                width: 80.w,
                height: 120.h,
                child: Image.asset(
                  'assets/picture.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  children: [
                    Text(
                      "data",
                      style: CustomTextStyle.generalButtonTextStyle12,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "data",
                      style: CustomTextStyle.generalButtonTextStyle10,
                    ),
                    SizedBox(
                      height: 44.h,
                    ),
                    Text(
                      "data",
                      style:
                          CustomTextStyle.generalButtonTextStyleBlueMagenta16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
