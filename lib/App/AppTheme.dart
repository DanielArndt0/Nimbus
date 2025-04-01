import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class AppTheme {
  static final themeData = ThemeData(
    fontFamily: 'Gilroy',
    
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primaryMaterial,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
