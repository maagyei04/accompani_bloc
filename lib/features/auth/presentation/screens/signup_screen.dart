import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/features/auth/presentation/widgets/footer_widget.dart';
import 'package:accompani_bloc/features/auth/presentation/widgets/form_widget.dart';
import 'package:accompani_bloc/features/auth/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80.0,
              ),
              HeaderWidget(
                  title: tSignup, subTitle: tSignupSubTitle, size: size),
              const FormWidget(
                loginPage: false,
                buttonText: tSignup,
              ),
              const FooterWidget(
                isLogin: false,
                navText: tAlreadyHaveAnAccount,
                buttonText: tLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
