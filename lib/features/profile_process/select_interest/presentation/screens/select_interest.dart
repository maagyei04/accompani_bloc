import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  SelectionScreenState createState() => SelectionScreenState();
}

class SelectionScreenState extends State<SelectionScreen> {
  List<String> selectedInterests = [];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  Widget buildInterestButton(String interest) {
    bool isSelected = selectedInterests.contains(interest);

    return GestureDetector(
      onTap: () => toggleInterest(interest),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSelected ? tPrimaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          interest,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              'You can add up to 10 suggested interests and 5 additional interests that not suggested',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  buildInterestButton('Technology'),
                  buildInterestButton('Travel'),
                  buildInterestButton('Food'),
                  buildInterestButton('Sports'),
                  buildInterestButton('Music'),
                  buildInterestButton('Fashion'),
                  buildInterestButton('Shopping'),
                  buildInterestButton('Dinning'),
                  buildInterestButton('Art'),
                  buildInterestButton('Bars'),
                  buildInterestButton('Museums'),
                  buildInterestButton('Night Life'),
                  buildInterestButton('wine'),
                  buildInterestButton('Cooking'),

                  // Add more interest buttons as needed
                ],
              ),
            ),
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
                child: OutlinedButton(
                    onPressed: () {
                      //stepController.nextPage();
                    },
                    child: const Text(tSkip)),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      /*
                      final user = InterestModel(
                        id: controller.getUserID,
                        interests: selectedInterests,
                        languages: data!.languages,
                        bio: data!.bio,
                        photos: data!.photos,
                      );

                      stepController.nextPageWithData(user);
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
