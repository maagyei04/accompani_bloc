import 'package:accompani_bloc/core/common_widgets/navigation_router/router.dart';
import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/image_strings.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:accompani_bloc/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
    this.isLogin = true,
    required this.buttonText,
    required this.navText,
  });

  final String buttonText;
  final String navText;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("or"),
        const SizedBox(
          height: tDefaultSize - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(tGoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () {},
            label: Text(
              tSignInWithGoogle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
        const SizedBox(
          height: tDefaultSize - 20,
        ),
        TextButton(
          onPressed: () {
            isLogin
                ? goTo(context, const SignUpScreen())
                : goTo(context, const LoginScreen());
          },
          child: Text.rich(TextSpan(
              text: navText,
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                    text: buttonText,
                    style: const TextStyle(
                      color: tPrimaryColor,
                    )),
              ])),
        ),
      ],
    );
  }
}
