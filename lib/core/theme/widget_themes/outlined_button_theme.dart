import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To Avoid Creating Instances

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      foregroundColor: tPrimaryColor,
      side: const BorderSide(
      color: tPrimaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight - 5),
    ),    
  );

  static final darkOulinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      foregroundColor: tWhiteColor,
      side: const BorderSide(
      color: tWhiteColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: tButtomHeight - 5),
    ), 
  );
}