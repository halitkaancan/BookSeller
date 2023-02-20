import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/best_seller/view_model/best_seller_viewmodel.dart';
import 'package:mobileapp/product/text_style/text_style.dart';

import '../../../product/component/general_color.dart';
import '../../../product/component/general_paddin.dart';
import '../../../product/component/search_bar.dart';
import '../../book_details/view/book_details.dart';
import '../../home/model/model_category.dart';
import '../../home/model/model_product.dart';

class BestSellerPage extends StatefulWidget {
  const BestSellerPage({super.key});

  @override
  State<BestSellerPage> createState() => _BestSellerPageState();
}

class _BestSellerPageState extends BestSellerViewModel {
  List<CategoryModel>? categoriesList = [];
  List<BestSellerModel>? productList = [];

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
      body: FutureBuilder(
          future: getListProduct(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Padding(
                padding: GeneralPadding(),
                child: Column(
                  children: [
                    SearchBar(),
                    SizedBox(
                      height: 40.h,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 170 / 284, // 170/210 = 0.809523
                        ),
                        itemCount: resourceProduct.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookDetailsView(
                                    bestSellerModel: resourceProduct[index],
                                  ),
                                ),
                              );
                              // productService.getProductImage(
                              //     cover: resourceProduct[index]
                              //         .cover!); //tıklanan indeskteski productmodeli vericem.bestsellermodel türünde değişken açıcam gittiğim saayfada resourceProduct[index].name  kullanıcam
                            },
                            child: Card(
                              color: ColorLightWhite1(),
                              child: Column(
                                children: [
                                  //Image.asset("assets/dune.png"),
                                  Image.network(
                                      resourceProduct[index].cover ?? ""),
                                  // Image.network(
                                  //    resourceProduct[index].cover.,
                                  //   height: 225.h,
                                  //   width: 150.w,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                                resourceProduct[index].name ??
                                                    "",
                                                style: CustomTextStyle
                                                    .generalButtonTextStyle10),
                                            Text(
                                                resourceProduct[index].author ??
                                                    "",
                                                style: CustomTextStyle
                                                    .generalButtonTextStyle8),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              resourceProduct[index]
                                                  .price
                                                  .toString(),
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
              );
            } else {
              return Center(child: Text("Data bulunamadı"));
            }
          }),
    );
  }
}
