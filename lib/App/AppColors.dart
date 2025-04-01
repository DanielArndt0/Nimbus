import 'package:flutter/material.dart';

class AppColors {
  static final primary = Color(0xFF567DF4);

  static final primaryMaterial= MaterialColor(
    primary.value,
    primarySwatch,
  );

  static final primarySwatch = {
    50: Color.fromRGBO(86, 125, 244, .1),
    100: Color.fromRGBO(86, 125, 244, .2),
    200: Color.fromRGBO(86, 125, 244, .3),
    300: Color.fromRGBO(86, 125, 244, .4),
    400: Color.fromRGBO(86, 125, 244, .5),
    500: Color.fromRGBO(86, 125, 244, .6),
    600: Color.fromRGBO(86, 125, 244, .7),
    700: Color.fromRGBO(86, 125, 244, .8),
    800: Color.fromRGBO(86, 125, 244, .9),
    900: Color.fromRGBO(86, 125, 244, 1),
  };

  static final subtext = Color(0xFF7B7F9E);
  static final fontColor = Color(0xFF22215B);
}
