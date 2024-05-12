import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({
    super.key,
  });

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loading = false;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Provide Info Below To Continue',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize - 10),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: tDefaultSize,
                  ),
                  InternationalPhoneNumberInput(
                    height: 50,
                    inputFormatters: const [],
                    formatter: MaskedInputFormatter('000 000 0000'),
                    initCountry: CountryCodeModel(
                        name: "United States", dial_code: "+1", code: "US"),
                    betweenPadding: 8,
                    onInputChanged: (number) {
                      var fullNumber = '${number.dial_code} ${number.number}';
                      fullNumber = fullNumber.replaceAll(' ', '');
                      phoneNumberController.text = fullNumber;
                    },
                    dialogConfig: DialogConfig(
                      backgroundColor: tWhiteColor,
                      searchBoxBackgroundColor:
                          const Color.fromARGB(255, 199, 200, 199),
                      searchBoxIconColor: tDarkColor,
                      countryItemHeight: 55,
                      topBarColor: tDarkColor,
                      selectedItemColor:
                          const Color.fromARGB(255, 199, 200, 199),
                      selectedIcon: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.phone_android_rounded,
                          )),
                      textStyle: const TextStyle(
                          color: tDarkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      searchBoxTextStyle: const TextStyle(
                          color: tDarkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      titleStyle: const TextStyle(
                          color: tDarkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                      searchBoxHintStyle: const TextStyle(
                          color: tDarkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    countryConfig: CountryConfig(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 103, 101, 101),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        noFlag: false,
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    phoneConfig: PhoneConfig(
                      focusedColor: tPrimaryColor,
                      enabledColor: const Color.fromARGB(255, 103, 101, 101),
                      radius: 8,
                      hintText: tPhoneNumber,
                      borderWidth: 1,
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 15.0),
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: tFirstName,
                      hintText: tFirstName,
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
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: tLastName,
                      hintText: tLastName,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize + 230,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          /*

                          if (formKey.currentState!.validate()) {
                            final user = UserModel2(
                              id: controller2.getUserID,
                              phoneNumber: controller.phoneNumber.text.trim(),
                              firstName: controller.firstName.text.trim(),
                              lastName: controller.lastName.text.trim(),
                            );

                            SignUpController.instance.updateUserInfo(user);
                          }
                          */
                        },
                        child: loading == false
                            ? const Text(
                                tContinue,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: tWhiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('Loading...')
                                ],
                              )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
