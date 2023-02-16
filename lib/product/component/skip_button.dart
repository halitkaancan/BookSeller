import 'package:flutter/material.dart';

import '../text_style/text_style.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Skip',
          style: CustomTextStyle.generalButtonTextStyle,
        ));
  }
}
