import 'package:evaluation/helpers/core_classes/app_colors.dart';
import 'package:evaluation/helpers/core_classes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static ThemeData light() {
    return ThemeData(
      primaryColor: AppTheme.primaryColor,
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: AppTheme.backGroundColor,
      platform: TargetPlatform.iOS,
      fontFamily: Family.regular,
      unselectedWidgetColor: AppTheme.secondaryColor,
      indicatorColor: AppTheme.primaryColor,
      backgroundColor: AppTheme.backGroundColor,
      sliderTheme: SliderThemeData(
        valueIndicatorColor: AppTheme.primaryColor,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors().colorLModeAccent),
        bodyText2:
            TextStyle(fontSize: 16.sp, color: AppColors().colorLModeAccentGrey),
        subtitle1: TextStyle(
            fontSize: 16.sp, color: AppColors().colorLModeAccentLight),
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppTheme.appBarTextColor,
          ),
          titleTextStyle: TextStyle(
              color: AppTheme.appBarTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
          backgroundColor: AppTheme.appBarColor),
    );
  }
}

// var colorPrimary = AppTheme.primaryColor;
// var colorPrimary2 = const Color(0xff61B80C);
// var colorGery1 = const Color(0xff707070);
// var colorGery2 = const Color(0xff808080);
// var colorGery3 = const Color(0xff9c9c9c);
// var colorGery4 = const Color(0xFFB1B1B1);
// var colorWhite = const Color(0xffffffff);
// var colorWhite2 = const Color(0xffF1F1F1);
