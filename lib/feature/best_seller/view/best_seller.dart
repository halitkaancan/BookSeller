import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/best_seller/view_model/best_seller_viewmodel.dart';
import 'package:mobileapp/feature/home/viewmodel/home_viewmodel.dart';
import 'package:mobileapp/product/text_style/text_style.dart';

import '../../../product/component/general_color.dart';
import '../../../product/component/general_paddin.dart';
import '../../../product/component/search_bar.dart';
import '../../book_details/view/book_details.dart';
import '../../home/model/model_category.dart';
import '../model/model_best_seller.dart';

class BestSellerPage extends StatefulWidget {
  BestSellerPage(
      {super.key,
      required this.list,
      required this.title,
      required this.token});
  final List<BestSellerModel> list;
  final String token;

  final String title;

  @override
  State<BestSellerPage> createState() => _BestSellerPageState();
}

class _BestSellerPageState extends BestSellerViewModel {
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
              widget.title,
              style: CustomTextStyle.generalButtonTextStyleBlueMagentaBlack20,
            ),
          )
        ],
      ),
      body: Padding(
        padding: GeneralPadding(),
        child: Column(
          children: [
            const SearchBar(),
            SizedBox(
              height: 40.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 170 / 284, // 170/210 = 0.809523
                ),
                itemCount: widget.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsView(
                            token: widget.token,
                            //list: [],
                            content: widget.list[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: ColorLightWhite1(),
                      child: Column(
                        children: [
                          Image.network(widget.list[index].cover ?? ""),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.list[index].name ?? "",
                                        style: CustomTextStyle
                                            .generalButtonTextStyle10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(widget.list[index].author ?? "",
                                          style: CustomTextStyle
                                              .generalButtonTextStyle8),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.list[index].price.toString(),
                                      style: CustomTextStyle
                                          .generalButtonTextStyleBlueMagent16,
                                    ),
                                  ],
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
        ),
      ),
    );
  }
}
