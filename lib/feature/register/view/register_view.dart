import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/register/viewmodel/register_viewmodel.dart';
import 'package:mobileapp/product/component/general_pictures.dart';

import '../../../product/component/general_button.dart';
import '../../../product/component/general_color.dart';
import '../../../product/component/general_paddin.dart';
import '../../../product/component/general_text.dart';
import '../../../product/text_style/text_style.dart';
import '../../login/view/login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel {
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
              child: Form(
                ////FORM WIDGETINI ARASITR
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60.h, left: 145.r),
                      child: SizedBox(
                        width: 100.w,
                        height: 65.h,
                        child: LogoSVG(),
                      ),
                    ),
                    heightSpace(115),
                    textTypes("Welcome ", 16),
                    textTypes("Register an account", 20),
                    SizedBox(
                      height: 80.h,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: 'John Doe',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    heightSpace(24),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: 'john@mail.com',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    heightSpace(24),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: '**********',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    heightSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()),
                            );
                          },
                          child: CustomText("Login"),
                        ),
                      ],
                    ),
                    heightSpace(15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60.h),
                          backgroundColor: const Color(0xFFEF6B4A)),
                      onPressed: isRegistering ? null : registerNow,
                      child: isRegistering
                          ? CircularProgressIndicator()
                          : Text(
                              'Register',
                              style: CustomTextStyle.generalButtonTextStyle,
                            ),
                    ),
                    const SizedBox(
                      height: 40,
                    )
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
