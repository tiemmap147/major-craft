import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_craft_application/theme/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle smallText10() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontSize: 10.sp,
      height: 15 / 10,
    );
  }

  static TextStyle smallText12Regular() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.neutral700,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      height: 18 / 12,
    );
  }

  static TextStyle smallText12Medium() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.primary400,
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      height: 18 / 12,
    );
  }

  static TextStyle secondaryText14Regular() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      height: 21 / 14,
    );
  }

  static TextStyle secondaryText14Semibold() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.primary400,
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
      height: 21 / 14,
    );
  }

  static TextStyle secondaryText14Medium() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      height: 21 / 14,
    );
  }

  static TextStyle primaryText16Medium() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      height: 24 / 16,
    );
  }

  static TextStyle primaryText16Semibold() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.sematicWarning,
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      height: 24 / 16,
    );
  }

  static TextStyle primaryText16Regular() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.sematicWarning,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      height: 24 / 16,
    );
  }

  static TextStyle barlow() {
    return GoogleFonts.barlow(
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      height: 22.4 / 16,
    );
  }

  static TextStyle beVietNam() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.neutral500,
      fontWeight: FontWeight.w500,
      fontSize: 12.sp,
      height: 18 / 12,
    );
  }

  static TextStyle subText18Semibold() {
    return GoogleFonts.beVietnamPro(
      color: AppColors.sematicSuccess,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      height: 23.4 / 12,
    );
  }
}
