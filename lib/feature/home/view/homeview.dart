import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/best_seller/view/best_seller.dart';
import 'package:mobileapp/feature/home/viewmodel/home_viewmodel.dart';
import 'package:mobileapp/product/component/general_pictures.dart';
import '../../../product/component/general_color.dart';
import '../../../product/component/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({required this.token});
  final String token;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: SizedBox(
            width: 50.w,
            height: 32.h,
            child: logoSVG(),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 20.w,
              top: 30.h,
            ).h,
            child: Text(
              'Catalog',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: colorBlack()),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
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
                  child: const SearchBar(),
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
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, "/bestSeller");
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
                      color: colorCinnabar(),
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
                                        resourceProductHome[index][index1]
                                                .name ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: colorBlack())),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      resourceProductHome[index][index1]
                                              .author ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: colorBlack(),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 44.h,
                                    ),
                                    Text(
                                      resourceProductHome[index][index1]
                                          .price
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600),
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

  ListView BookTypesButton() {
    bool isPressed;
    return ListView.builder(
        itemCount: bookTypes.length,
        itemExtent: 120,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9).w,
            child: ElevatedButton(
              key: ValueKey(getButtonName(index)),
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    } else {
                      return selectedIndex == index
                          ? colorBlueMagenta()
                          : colorLightWhite1();
                    }
                  },
                ),
              ),
              child: Text(
                getButtonName(index),
                style: TextStyle(
                    color: colorBlack(),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          );
        });
  }
}
