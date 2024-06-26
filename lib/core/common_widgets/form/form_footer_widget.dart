import 'package:accompani_bloc/core/constants/image_strings.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:flutter/material.dart';


class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          const Text("OR"),

          const SizedBox(height: tDefaultSize - 20,),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0,),
              onPressed: () {},
              label: const Text(tSignInWithGoogle),
            ),
          ),

    const SizedBox(height: tDefaultSize - 20,),

      TextButton(
        onPressed: () {},
        child: Text.rich(
          TextSpan(
            text: tDontHaveAnAccount,
            style: Theme.of(context).textTheme.bodySmall,
            children: const [
              TextSpan(
                text: tSignup,
                style: TextStyle(
                  color: Colors.blue,
                )
              ),
            ]
          ) 
        ),
      ),
      ],
    );
  }
}