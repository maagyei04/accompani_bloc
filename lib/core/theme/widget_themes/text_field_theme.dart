import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = 
    const InputDecorationTheme(
      contentPadding: EdgeInsets.all(23),
      filled: true,
      fillColor: tWhiteColor,
      labelStyle: TextStyle(fontSize: 15),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      prefixIconColor: tSecondaryColor,
      floatingLabelStyle: TextStyle(
        fontSize: 15,
        color: tSecondaryColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0, 
          color: tPrimaryColor,
        ),
      ),         
    );

  static InputDecorationTheme darkInputDecorationTheme = 
    const InputDecorationTheme(     
      contentPadding: EdgeInsets.all(23),
      filled: true,
      fillColor: tDarkthemecontainercolor,
      labelStyle: TextStyle(fontSize: 15),
      border: OutlineInputBorder(
        borderSide:BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: TextStyle(
        fontSize: 15,
        color: tPrimaryColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0, 
          color: tPrimaryColor,
        ),
      )      
    );
}