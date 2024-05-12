import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class ButtomModal extends StatelessWidget {
  const ButtomModal({
    super.key,
    required this.btnIcon,
    required this.subTitle,
    required this.title,
    required this.onTap,
  });

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(tDefaultSize - 20),
            topRight: Radius.circular(tDefaultSize - 20),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          color: Colors.grey.shade400,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            const SizedBox(
              width: tDefaultSize - 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                    width: 150.0,
                    child: Text(
                      subTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
