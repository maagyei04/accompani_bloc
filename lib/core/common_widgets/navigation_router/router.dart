import 'package:flutter/material.dart';

Future<dynamic> goTo(BuildContext context, Widget screen) {
  return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}
