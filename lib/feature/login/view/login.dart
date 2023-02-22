import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/home/view/homeview.dart';
import 'package:mobileapp/feature/login/viewmodel/login_viewmodel.dart';

import '../../../product/component/general_button.dart';
import '../../../product/component/general_color.dart';
import '../../../product/component/general_paddin.dart';
import '../../../product/component/general_text.dart';
import '../../register/view/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void login(String email, password) {
    try {} catch (e) {
      print(e.toString());
    }
  }

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
                    SizedBox(
                      height: 80.h,
                    ),
                    textTypes("E-mail", 16),
                    heightSpace(8),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: 'john@mail.com',
                        border: InputBorder.none,
                      ),
                    ),
                    heightSpace(24),
                    TextFormField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: '**********',
                        border: InputBorder.none,
                      ),
                    ),
                    heightSpace(8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CheckboxListTile(
                                activeColor: ColorBlueMagenta(),
                                title: const Text(
                                  'Remember me',
                                  style: TextStyle(color: Color(0xFF6251DD)),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: true,
                                onChanged: (bool? isChecked) {
                                  setState(() {
                                    isChecked = isChecked!;
                                  });
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
                                  builder: (context) => const RegisterView()),
                            );
                          },
                          child: CustomText("Register"),
                        ),
                      ],
                    ),
                    Expanded(child: heightSpace(10)),
                    GeneralButton(
                      buttonText: "Login",
                      onPressed: () async {
                        await loginButton(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );

                        if (token!.isEmpty || token == null) {
                          // ignore: use_build_context_synchronously
                          await showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              title: Text("Error"),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          );
                        } else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        }
                      },
                    ),
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
