import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/register/viewmodel/register_viewmodel.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;
  bool _isRegistering = false;

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
                key: _formKey,
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
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: 'John Doe',
                        border: InputBorder.none,
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
                      controller: _emailController,
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
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF4F4FF),
                        hintText: '**********',
                        border: InputBorder.none,
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
                      onPressed: _isRegistering ? null : _register,
                      child: _isRegistering
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

  SvgPicture Logo() => SvgPicture.asset('assets/logo.svg');

  SizedBox heightSpace(double HeightSpace) {
    return SizedBox(
      height: HeightSpace.h,
    );
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistering = true;
      });

      final success = await register(_emailController.text,
          _nameController.text, _passwordController.text);

      setState(() {
        _isRegistering = false;
      });

      if (success) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginView()));
      } else {
        // ignore: use_build_context_synchronously
        await showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Someting went wrong, please try again "),
            contentPadding: EdgeInsets.all(20),
          ),
        );
      }
    }
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
