import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.showBackArrow = false, 
    this.leadingOnPressed, 
    this.image,
  }); 

    final Widget? title;
    final NetworkImage? image;
    final bool showBackArrow;
    final IconData? leadingIcon;
    final List<Widget>? actions;
    final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(tDefaultSize - 20),
    child: AppBar(
      automaticallyImplyLeading: false,
      title: title,
      actions: actions,
    )
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}