import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: tPrimaryColor,),
        ),
        SizedBox(width: 10,),
        Text('Loading...')
      ],
    );
  }
}