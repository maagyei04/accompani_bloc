import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/theme/widget_themes/app_bar_theme.dart';
import 'package:accompani_bloc/core/theme/widget_themes/elevated_button_theme.dart';
import 'package:accompani_bloc/core/theme/widget_themes/outlined_button_theme.dart';
import 'package:accompani_bloc/core/theme/widget_themes/text_field_theme.dart';
import 'package:accompani_bloc/core/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {

  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: tLightbackgroundcolor,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
  );
 
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: tDarkbackgroundcolor,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOulinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
  );
  
}