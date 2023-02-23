import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/product/component/general_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/component/skip_button.dart';
import '../../home/view/homeview.dart';
import '../../login/view/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D4E),
      body: Column(
        children: [
          Expanded(child: Center(child: SvgPicture.asset('assets/logo.svg'))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 39),
            child: Column(
              children: [
                GeneralButton(
                    buttonText: "Login",
                    onPressed: () async {
                      await checkLoginStatus();
                    }),
                SkipButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    if (token != null) {
      // Token varsa ana sayfaya yönlendirin.
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeView(token: token)),
          (route) => route.isFirst);
    } else {
      // Token yoksa giriş sayfasına yönlendirin.
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginView()),
          (route) => route.isFirst);
    }
  }
}
