import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/best_seller/model/model_best_seller.dart';
import 'package:mobileapp/product/component/general_button.dart';
import 'package:mobileapp/product/component/general_paddin.dart';

import '../../../product/component/general_color.dart';
import '../../../product/text_style/text_style.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.bestSellerModel,
  });
  final BestSellerModel bestSellerModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
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
            //future: getList(),
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
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 100.w, top: 33.h, bottom: 20.h),
                  child: Image.asset("assets/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 15.w),
                  child: IconButton(
                    onPressed: () {},
                    splashRadius: 25, // Yayılma yarıçapı
                    iconSize: 30,
                    icon: const Icon(
                      Icons.favorite_border,
                    ),

                    color: ColorBlueMagenta(),
                    highlightColor: Colors.red,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.bestSellerModel.name ?? "",
                          style: CustomTextStyle.generalButtonTextStyle20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.bestSellerModel.author ?? "",
                            style: CustomTextStyle
                                .generalButtonTextStyleColorBlack16)
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [Text("Summary")],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            widget.bestSellerModel.description ?? "",
                            maxLines: 7,
                            textAlign: TextAlign.right,
                            softWrap: true,
                            style: CustomTextStyle
                                .generalButtonTextStyleColorBlack16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GeneralButton(),
          ],
        ),
      ),
    );
  }
}
