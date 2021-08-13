import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_purpose_app/utils/app_colors.dart';

class Styles {
  static final Styles instance = Styles._internal();

  factory Styles() {
    return instance;
  }

  Styles._internal();

  InputBorder get outlineBorder => OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
        borderSide: BorderSide(color: AppColors.black65, width: 1.w),
      );

  TextStyle get text16BoldWhite => GoogleFonts.lato(
        fontSize: 16.sp,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
  TextStyle get text14White => GoogleFonts.lato(
        fontSize: 14.sp,
        color: Colors.white,
      );
}
