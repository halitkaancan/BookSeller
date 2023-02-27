import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/product/component/general_color.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {super.key, this.onPressed, required this.buttonText, this.secondText});

  final void Function()? onPressed;
  final String buttonText;
  final String? secondText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60.h),
          backgroundColor: colorCinnabar()),
      child: secondText == null
          ? Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(buttonText), Text(secondText!)],
            ),
    );
  }
}

class CustomButtonOneName extends StatelessWidget {
  final String buttonName;
  const CustomButtonOneName({
    super.key,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "$buttonName",
        style: TextStyle(
          color: Color(
            0xFF6251DD,
          ),
        ),
      ),
    );
  }
}
