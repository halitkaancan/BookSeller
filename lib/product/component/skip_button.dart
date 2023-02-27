import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Text(
          'Skip',
          // style: CustomTextStyle.generalButtonTextStyle,
        ));
  }
}
