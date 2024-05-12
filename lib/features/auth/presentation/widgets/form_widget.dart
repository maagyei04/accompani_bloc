import 'package:accompani_bloc/core/common_widgets/loader/loader.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/core/utils/show_snackbar.dart';
import 'package:accompani_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  final bool loginPage;
  final String buttonText;

  const FormWidget({
    super.key,
    this.loginPage = true,
    required this.buttonText,
  });

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: tDefaultSize - 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(146, 101, 100, 100),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(-6, 7),
                        )
                      ],
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "$tEmail is missing";
                        }
                        return null;
                      },
                      controller: emailController,
                      style: const TextStyle(fontSize: 15.0),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: tEmail,
                        hintText: tEmailHint,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize - 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(146, 101, 100, 100),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(-6, 7),
                        )
                      ],
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "$tPassword is missing";
                        }
                        return null;
                      },
                      controller: passwordController,
                      style: const TextStyle(fontSize: 15.0),
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.fingerprint),
                          labelText: tPassword,
                          hintText: tPassword,
                          suffixIcon: IconButton(
                              icon: _isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              })),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize - 10,
                  ),
                  widget.loginPage
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              //
                            },
                            child: const Text(
                              tForgotPassword,
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        )
                      : const Text(''),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(148, 0, 0, 0),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset: Offset(-6, 7),
                        )
                      ],
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              widget.loginPage
                                  ? context.read<AuthBloc>().add(
                                        AuthLogin(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        ),
                                      )
                                  : context.read<AuthBloc>().add(
                                        AuthSignUp(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        ),
                                      );
                            }
                          },
                          child: widget.loginPage
                              ? const Text(
                                  tLogin,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              : const Text(
                                  tSignup,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                ],
              ),
            )));
  }
}
