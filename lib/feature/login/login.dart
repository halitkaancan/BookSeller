import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/home/view/homeview.dart';

import '../../product/component/general_button.dart';
import '../../product/component/general_color.dart';
import '../../product/component/general_paddin.dart';
import '../../product/component/general_text.dart';
import '../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  _checkboxDegisti(isChecked) {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: GeneralPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60.h, left: 145.r),
                      child: SizedBox(
                        width: 100.w,
                        height: 65.h,
                        child: SvgPicture.asset('assets/logo.svg'),
                      ),
                    ),
                    heightSpace(115),
                    textTypes("Welcome Back!", 16),
                    textTypes("Login to your account", 20),
                    SizedBox(
                      height: 80.h,
                    ),
                    textTypes("E-mail", 16),
                    heightSpace(8),
                    const SizedBox(
                        child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "john@mail.com"),
                    )),
                    heightSpace(24),
                    textTypes("Password", 16),
                    heightSpace(8),
                    const SizedBox(
                        child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "••••••••••••"),
                    )),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CheckboxListTile(
                                activeColor: ColorBlueMagenta(),
                                title: const Text(
                                  'Remember me',
                                  //burada bir hata var ColorBlueMagenta(), ekleyemiyorum

                                  style: TextStyle(color: Color(0xFF6251DD)),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: true,
                                onChanged: (bool? i) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          child: CustomText("Register"),
                        ),
                      ],
                    ),
                    Expanded(child: heightSpace(10)),
                    GeneralButton(
                        buttonName: "Login",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        }),
                    heightSpace(40),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  SizedBox heightSpace(double HeightSpace) {
    return SizedBox(
      height: HeightSpace.h,
    );
  }

  Row textTypes(String text, double fontSize) {
    return Row(
      children: [
        SizedBox(
          child: Text(
            "$text",
            style:
                TextStyle(fontSize: fontSize.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

//SvgPicture Logo() => SvgPicture.asset('assets/images/logo.svg');
