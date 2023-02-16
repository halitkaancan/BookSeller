import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/login/login.dart';

import '../../product/component/general_button.dart';
import '../../product/component/general_color.dart';
import '../../product/component/general_paddin.dart';
import '../../product/component/general_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      child: Logo(),
                    ),
                  ),
                  heightSpace(115),
                  textTypes("Welcome ", 16),
                  textTypes("Register an account", 20),
                  SizedBox(
                    height: 80.h,
                  ),
                  textTypes("Name", 16),
                  const SizedBox(
                      child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "John Doe"),
                  )),
                  heightSpace(24),
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
                        border: OutlineInputBorder(), hintText: "••••••••••••"),
                  )),
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          activeColor: ColorBlueMagenta(),
                          title: const Text(
                            'Remember me',

                            //burada bir hata var ColorBlueMagenta(), ekleyemiyorum
                            style: TextStyle(color: Color(0xFF6251DD)),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: true,
                          onChanged: (bool? i) {
                            setState(() {});
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: CustomText("Login"),
                      ),
                    ],
                  ),
                  heightSpace(15),
                  GeneralButton(buttonName: "Register"),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  SvgPicture Logo() => SvgPicture.asset('assets/logo.svg');

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
