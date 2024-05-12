// ignore_for_file: avoid_print
import 'package:accompani_bloc/core/common_widgets/categories/vertical_categories.dart';
import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/features/profile_process/index_bloc.dart';
import 'package:accompani_bloc/features/profile_process/personal_info/presentation/widgets/multiple_image_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  PersonalInfoScreenState createState() => PersonalInfoScreenState();
}

class PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController languageController = TextEditingController();
  final bioController = TextEditingController();
  List<String> languageList = <String>[];

  @override
  void dispose() {
    languageController.dispose();
    super.dispose();
  }

  void addToTopOfList(String text) {
    setState(() {
      languageList.insert(0, text);
      languageController.clear();
    });
  }

  void removeFromLanguageList(String text) {
    setState(() {
      languageList.remove(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize - 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Upload Your Photos',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const MultipleImageUpload(),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Languages You Speak',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Input the languages you speak',
                style: TextStyle(fontSize: 12),
              ),
              const Text(
                'Press Enter/Done after every language you input',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: languageController,
                onFieldSubmitted: (text) {
                  print(languageList);
                  addToTopOfList(text);
                },
                style: const TextStyle(fontSize: 15.0),
                decoration: const InputDecoration(
                  labelText: 'Input Languages',
                  hintText:
                      'Input the languages you speak with \',\' seperating them',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: languageList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return TVerticalCategories(
                        backgroundColor: tPrimaryColor,
                        textColor: tWhiteColor,
                        title: languageList[index],
                        onTap: () {
                          removeFromLanguageList(languageList[index]);
                        },
                      );
                    }),
              ),
              const Text(
                'Your Bio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 15.0),
                controller: bioController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'About You',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                      //
                    },
                    child: const Text(tSkip)),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      /*
                      try {
                        List<String> imageUrls = await Future.wait([
                          controller6.uploadPostImage(),
                          controller6.uploadPostImage2(),
                          controller6.uploadPostImage3(),
                        ]);

                        if (imageUrls[0].isNotEmpty &&
                            imageUrls[1].isNotEmpty &&
                            imageUrls[2].isNotEmpty) {
                          String imageUrl = imageUrls[0];
                          String imageUrl2 = imageUrls[1];
                          String imageUrl3 = imageUrls[2];

                          final user = PersonalInfoModel(
                            id: controller2.getUserID,
                            languages: controller.languageList,
                            bio: controller.bio.text.trim(),
                            photos: [
                              imageUrl,
                              imageUrl2,
                              imageUrl3,
                            ],
                          );

                          stepController.nextPageWithData(user);
                        } else {
//
                        }
                      } catch (e) {
//
                      }
                      */
                    },
                    child: const Text(tNext)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
