import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/resources/app_theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent, elevation: 0),
    appBarTheme: const AppBarTheme(
      color: AppColors.secondaryBackground,
      centerTitle: true,
      elevation: 0,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        height: 1,
        overflow: TextOverflow.ellipsis,
        fontSize: 20.sp,
        fontFamily: "Lato",
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 16.sp,
        fontFamily: "Lato",
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 14.sp,
        fontFamily: "Lato",
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontFamily: "Lato",
        color: AppColors.secondaryTextColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class CustomTextStyle {
  TextStyle detailsSubInformation = TextStyle(
    color: Colors.white70,
    overflow: TextOverflow.ellipsis,
    fontFamily: "Lato",
    fontSize: 12.sp,
    height: 1,
    fontWeight: FontWeight.w700,
  );
}
