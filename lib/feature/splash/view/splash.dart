import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapp/feature/home/view/homeview.dart';
import 'package:mobileapp/product/component/general_button.dart';

import '../../../product/component/skip_button.dart';
import '../../login/view/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Bu kısımda Splash ekranda kalacak zamanı belirleyebilirsiniz.
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    });
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    }),
                SkipButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
