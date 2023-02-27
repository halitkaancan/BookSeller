import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/product/component/general_button.dart';
import '../../../product/component/general_color.dart';
import '../../../product/component/general_pictures.dart';
import '../../../product/component/skip_button.dart';

import '../modelview/splash_modelview.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends SplashModelView {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: midnightBlue(),
      body: Column(
        children: [
          Expanded(child: Center(child: logoSVG())),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 39.h),
            child: Column(
              children: [
                GeneralButton(
                    buttonText: "Login",
                    onPressed: () async {
                      await checkLoginStatus();
                    }),
                const SkipButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
