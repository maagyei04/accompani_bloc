import 'package:flutter/material.dart';

class MyProfilePic extends StatelessWidget {
  const MyProfilePic({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle onTap action
      },
      child: CircleAvatar(
        radius: 20,
        backgroundImage: const NetworkImage('user.photos[0'),
      ),
    );
  }
}
