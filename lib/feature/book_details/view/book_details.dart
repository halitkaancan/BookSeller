import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/best_seller/model/model_best_seller.dart';
import 'package:mobileapp/feature/book_details/viewmodel/book_details_viewmodel.dart';
import 'package:mobileapp/product/component/general_button.dart';
import 'package:mobileapp/product/service/project_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../product/component/general_color.dart';
import '../../../product/text_style/text_style.dart';

class BookDetailsView extends StatefulWidget {
  BookDetailsView({
    super.key,
    required this.content,
    required this.token, //required this.list,
  });
  final BestSellerModel content;
  final String token;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends BookDetailsViewModel with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: SizedBox(
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xFF090937),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        actions: [
          FutureBuilder(
            builder: (context, snapshot) => Padding(
              padding: EdgeInsets.only(right: 20.w, top: 40.h, bottom: 20.h),
              child: Text(
                'Book Details',
                style: CustomTextStyle.generalButtonTextStyleBlueMagentaBlack20,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(right: 20.w, left: 20.w, top: 33, bottom: 40.h),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 110.h),
                      child: Row(
                        children: [
                          Container(
                              width: 150.w,
                              height: 225.h,
                              child: Image.network(widget.content.cover ?? "")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 45.w, bottom: 170.h),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorLightWhite1(),
                            child: IconButton(
                              style: ButtonStyle(
                                  iconColor:
                                      MaterialStateProperty.all(Colors.yellow)),
                              onPressed: () {
                                setState(() {
                                  isPressed = !isPressed;
                                });
                              },
                              // Yayılma yarıçapı
                              iconSize: 30,
                              icon: Icon(
                                isPressed == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              color: ColorBlueMagenta(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    widget.content.name ?? "",
                    style: CustomTextStyle.generalButtonTextStyle20,
                  ),
                  SizedBox(height: 20.h),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Opacity(
                    opacity: 0.6,
                    child: Text(widget.content.author ?? "",
                        style:
                            CustomTextStyle.generalButtonTextStyleColorBlack16),
                  )
                ]),
                SizedBox(height: 10.h),
                Row(children: [
                  Container(
                    width: 350.w,
                    height: 208.h,
                    child: Text(
                      widget.content.description ?? "",
                      maxLines: 7,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: CustomTextStyle.generalButtonTextStyleColorBlack16,
                    ),
                  )
                ]),
                SizedBox(height: 90.h),
                GeneralButton(
                  buttonText: widget.content.price.toString(),
                  secondText: "Buy Now",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
