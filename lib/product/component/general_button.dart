import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text_style/text_style.dart';

class GeneralButton extends StatelessWidget {
  GeneralButton({super.key, this.buttonName, this.onPressed, this.NextPage});
  final String? buttonName;
  final void Function()? onPressed;
  final String? NextPage;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ??
          () {
            Navigator.pushNamed(context, NextPage!);
          },
      child: Text(
        buttonName ?? "",
        style: CustomTextStyle.generalButtonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60.h),
          backgroundColor: Color(0xFFEF6B4A)),
    );
  }
}
