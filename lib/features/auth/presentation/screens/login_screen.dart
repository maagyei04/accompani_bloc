import 'package:accompani_bloc/core/common_widgets/loader/loader.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/core/utils/show_snackbar.dart';
import 'package:accompani_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:accompani_bloc/features/auth/presentation/widgets/footer_widget.dart';
import 'package:accompani_bloc/features/auth/presentation/widgets/form_widget.dart';
import 'package:accompani_bloc/features/auth/presentation/widgets/header_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Loader();
        }

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
                      title: tLogin, subTitle: tLoginSubTitle, size: size),
                  const FormWidget(
                    loginPage: true,
                    buttonText: tLogin,
                  ),
                  const FooterWidget(
                    navText: tNewAccount,
                    buttonText: tSignup,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
