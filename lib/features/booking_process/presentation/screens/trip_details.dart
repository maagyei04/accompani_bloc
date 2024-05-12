import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/features/booking_process/presentation/screens/survey.dart';
import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final title = TextEditingController();
    final description = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              //Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          'Trip Details',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(fontSize: 15.0),
                    controller: title,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      hintText: 'title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 15.0),
                    maxLines: 5,
                    controller: description,
                    decoration: const InputDecoration(
                      labelText: 'Trip Description',
                      hintText: 'description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  /* ---- sign in via email method
                      SignUpController.instance.registerUser(
                        controller.email.text.trim(), 
                        controller.password.text.trim(),
                      );
                      ---- */

                  /* --
                      SignUpController.instance.phoneAuthentication(
                        controller.phoneNumber.text.trim()
                      );
                      Get.to(() => const OTPScreen());
                      -- */
                  if (title.text.isNotEmpty && description.text.isNotEmpty) {
                    /*final trip = TripModel(
                            title: title.text.trim(),
                            description: description.text.trim(),
                            activity: 'Default...',
                            destination: 'Default...',
                            arrivalDate: 'Default..',
                            cost: 'Default...',
                            guestAdded: [
                              'Default...',
                              'Default...',
                            ],
                            status: 'Default...',
                            purpose: 'Default...',
                            host: 'Default...',
                            duration: 'Default...',
            
                          );
                          */

                    //Get.to(() => const SurveyScreen(), arguments: trip);
                  } else {
                    // Handle case where not all fields are filled
                    /* Get.snackbar(
                        "Error",
                        "Please fill all the fields",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.redAccent.withOpacity(0.3),
                        colorText: Colors.red,
                        duration: const Duration(seconds: 7),
                      );
                      */
                  }
                }
              },
              child: const Text('Next')),
        ),
      ),
    );
  }
}
