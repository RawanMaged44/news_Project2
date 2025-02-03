import 'package:flutter/material.dart';
import 'package:news_project/utils/app_colors.dart';
import 'package:news_project/utils/app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.blackColor),
        backgroundColor: AppColors.whiteColor,
          centerTitle: true),
    textTheme: TextTheme(
      labelLarge: AppStyles.medium24black,
        headlineLarge: AppStyles.bold16black,
        headlineMedium: AppStyles.medium14black
    ),
    indicatorColor: AppColors.blackColor
  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          backgroundColor: AppColors.blackColor,
          centerTitle: true),
      textTheme: TextTheme(
          labelLarge: AppStyles.medium24white,
        headlineLarge: AppStyles.bold16white,
        headlineMedium: AppStyles.medium14white
      ),
      indicatorColor: AppColors.whiteColor


  );

}