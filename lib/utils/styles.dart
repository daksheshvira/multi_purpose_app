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

  final outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.r)),
    borderSide: BorderSide(color: AppColors.black65, width: 1.w),
  );

  final text16BoldWhite = GoogleFonts.lato(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  final text14White = GoogleFonts.lato(
    fontSize: 14.sp,
    color: Colors.white,
  );

  final text24White = GoogleFonts.lato(
    fontSize: 24.sp,
    color: Colors.white,
  );

  final text14ExtraBoldWhite = GoogleFonts.lato(
    fontSize: 14.sp,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );

  final text18ExtraBoldWhite = GoogleFonts.lato(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );

  final text14Gray = GoogleFonts.lato(
    fontSize: 14.sp,
    color: AppColors.gray147,
  );

  final text14GrayLight = GoogleFonts.lato(
    fontSize: 14.sp,
    color: AppColors.gray147,
    fontWeight: FontWeight.w300,
  );

  final text32ExtraBoldWhite = GoogleFonts.lato(
    fontSize: 28.sp,
    color: Colors.white,
    fontWeight: FontWeight.w800,
  );

  final text14SemiBoldSuccess = GoogleFonts.lato(
    fontSize: 14.sp,
    color: AppColors.success,
    fontWeight: FontWeight.w500,
  );

  final text14SemiBoldError = GoogleFonts.lato(
    fontSize: 14.sp,
    color: AppColors.error,
    fontWeight: FontWeight.w500,
  );
}
