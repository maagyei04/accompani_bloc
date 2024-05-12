import 'package:accompani_bloc/core/common_widgets/navigation_router/router.dart';
import 'package:accompani_bloc/core/common_widgets/rive/rive.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/nav_menu.dart';
import 'package:flutter/material.dart';

class ProfileCompleteScreen extends StatelessWidget {
  const ProfileCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RiveWidget(
              asset: 'assets/rive/success.riv',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 12.0,
            ),
            SizedBox(
                width: 260,
                child: Text(
                  'Youv\'e completed your Profile Setup Process',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      goTo(context, NavMenu());
                    },
                    child: const Text(tGetStarted)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
