import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/App/AppColors.dart';

class AppTheme {
  static final themeData = ThemeData(
    // textTheme: GoogleFonts.lexendTextTheme(),
    primaryColor: AppColors.primary,
    primarySwatch: AppColors.primaryMaterial,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
