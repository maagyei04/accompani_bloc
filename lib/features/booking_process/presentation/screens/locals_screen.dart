import 'package:accompani_bloc/core/common_widgets/searchbar/search_bar.dart';
import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/image_strings.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/features/booking_process/presentation/widgets/overlay_container.dart';
import 'package:flutter/material.dart';

class LocalsScreen extends StatelessWidget {
  LocalsScreen({super.key});

  //final trip = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              //Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          'Survey - Locals',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            children: [
              const Text(
                'What are you looking to do...',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: tDarkColor),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TSearchContainer(width: widthSize, text: 'Search...'),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    OverlayContainer(
                      text: 'Learn & Explore',
                      image: tWelcomeImage2,
                    ),
                    OverlayContainer(
                      text: 'Must-Visit',
                      image: tWelcomeImage,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    OverlayContainer(
                      text: 'Entertainment',
                      image: tWelcomeImage3,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    OverlayContainer(
                      text: 'Professional Needs',
                      image: tWelcomeImage4,
                    ),
                    OverlayContainer(
                      text: 'OutdoorActivities',
                      image: tWelcomeImage2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
