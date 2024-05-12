import 'package:flutter/material.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
  });

  final Size size;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge,),
        Text(subTitle, style: Theme.of(context).textTheme.displayMedium,),
              const SizedBox(height: 20.0,),

      ],
    );
  }
}