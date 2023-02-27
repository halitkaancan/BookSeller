import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileapp/product/component/general_color.dart';

class GeneralTheme {
  final generalTheme = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: 92.h,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.manrope(
        color: colorBlueMagenta(),
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: GoogleFonts.manrope(
        color: colorBlueMagenta(),
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.manrope(
        color: colorBlueMagenta(),
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
