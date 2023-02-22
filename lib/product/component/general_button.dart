import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/product/component/general_color.dart';

import '../text_style/text_style.dart';

class GeneralButton extends StatelessWidget {
  GeneralButton(
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
          backgroundColor: ColorCinnabar()),
      child: secondText == null
          ? Text(
              buttonText ?? '',
              style: CustomTextStyle.generalButtonTextStyle,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(buttonText), Text(secondText!)],
            ),
    );
  }
}

class TextButtonStyle extends StatelessWidget {
  const TextButtonStyle({super.key, this.onPressed, this.buttonText});
  final void Function()? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child:
          Text(buttonText ?? '', style: CustomTextStyle.generalButtonTextStyle),
    );
  }
}

// ElevatedButton(
//       onPressed: onPressed ??
//           () {
//             Navigator.pushNamed(context, NextPage!);
//           },
//       child: Row(
//         mainAxisAlignment: (buttonName != null && buttonName2 != null)
//             ? MainAxisAlignment.spaceBetween
//             : MainAxisAlignment.center,
//         children: [
//           Text(
//             buttonName ?? buttonName2 ?? "",
//             style: CustomTextStyle.generalButtonTextStyle,
//           ),
//         ],
//       ),
//       style: ElevatedButton.styleFrom(
//           minimumSize: Size(double.infinity, 60.h),
//           backgroundColor: Color(0xFFEF6B4A)),
//     );
//   }
// }
