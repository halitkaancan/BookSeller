import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapp/feature/register/viewmodel/register_viewmodel.dart';
import 'package:mobileapp/product/component/general_pictures.dart';
import '../../../product/component/general_button.dart';
import '../../../product/component/general_color.dart';
import '../../../product/component/general_paddin.dart';
import '../../../product/component/general_text.dart';
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
              padding: generalPadding(),
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
                        child: logoSVG(),
                      ),
                    ),
                    heightSpace(115),
                    //Text(),
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
                      children: const [
                        CustomButtonOneName(buttonName: "Register"),
                      ],
                    ),
                    heightSpace(15),
                    GeneralButton(
                      buttonText: "Register",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      },
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

// class Text extends StatelessWidget {
//   final String text;
//   const Text({
//     super.key,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           child: Text("$text",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: colorBlack(), fontWeight: FontWeight.bold)),
//         ),
//       ],
//     );
//   }
// }
