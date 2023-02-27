import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileapp/feature/login/viewmodel/login_viewmodel.dart';
import 'package:mobileapp/product/component/general_pictures.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: generalPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60.h, left: 145.r),
                      child: SizedBox(
                        width: 100.w,
                        height: 65.h,
                        child: logoSVG(),
                      ),
                    ),
                    heightSpace(115),
                    SizedBox(
                      height: 80.h,
                    ),
                    const TextTypes(text: "E-mail", fontSize: 16),
                    heightSpace(8),
                    TextFormField(
                      controller: emailController,
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
                      obscureText: obscureText,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(obscureText
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
                                activeColor: colorBlueMagenta(),
                                title: const Text(
                                  'Remember me',
                                  style: TextStyle(color: Color(0xFF6251DD)),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: isChecked,
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
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        checkToken();
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
    return SizedBox(height: HeightSpace.h);
  }
}

class TextTypes extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextTypes({required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Text(text.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
