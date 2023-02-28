import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/best_seller/model/model_best_seller.dart';
import 'package:mobileapp/feature/book_details/viewmodel/book_details_viewmodel.dart';
import 'package:mobileapp/product/component/general_button.dart';
import '../../../product/component/general_color.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.content,
    required this.token,
  });
  final BestSellerModel content;
  final String token;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends BookDetailsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: colorBlack()),
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
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 90.w),
                          child: Container(
                              width: 150.w,
                              height: 225.h,
                              child: Image.network(widget.content.cover ?? "")),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.w, bottom: 170.h),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: colorLightWhite1(),
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
                              color: colorBlueMagenta(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                BookName(widget: widget),
                BookAuthorName(widget: widget),
                SizedBox(height: 10.h),
                BookDescription(widget: widget),
                SizedBox(height: 75.h),
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

class BookDescription extends StatelessWidget {
  const BookDescription({
    super.key,
    required this.widget,
  });

  final BookDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 350.w,
        height: 208.h,
        child: Text(
          widget.content.description ?? "",
          maxLines: 7,
          textAlign: TextAlign.left,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: colorBlack()),
        ),
      )
    ]);
  }
}

class BookAuthorName extends StatelessWidget {
  const BookAuthorName({
    super.key,
    required this.widget,
  });

  final BookDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Opacity(
        opacity: 0.6,
        child: Text(widget.content.author ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorBlack())),
      )
    ]);
  }
}

class BookName extends StatelessWidget {
  const BookName({
    super.key,
    required this.widget,
  });

  final BookDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        widget.content.name ?? "",
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: colorBlack()),
      ),
      SizedBox(height: 20.h),
    ]);
  }
}
