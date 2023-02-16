import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/product/text_style/text_style.dart';

import '../../../product/component/search_bar.dart';

class BestSellerPage extends StatefulWidget {
  const BestSellerPage({super.key});

  @override
  State<BestSellerPage> createState() => _BestSellerPageState();
}

class _BestSellerPageState extends State<BestSellerPage> {
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
          Padding(
            padding: EdgeInsets.only(right: 20.w, top: 40.h, bottom: 20.h),
            child: Text(
              'Best Seller',
              style: CustomTextStyle.generalButtonTextStyleBlueMagentaBlack20,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 33.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            SearchBar(),
          ],
        ),
      ),
    );
  }
}
