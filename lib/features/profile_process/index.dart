import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/features/profile_process/completed/presentation/screens/profile_completed.dart';
import 'package:accompani_bloc/features/profile_process/index_bloc.dart';
import 'package:accompani_bloc/features/profile_process/personal_info/presentation/screens/personal_info.dart';
import 'package:accompani_bloc/features/profile_process/select_interest/presentation/screens/select_interest.dart';
import 'package:accompani_bloc/features/profile_process/social_link/presentation/screens/social_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';

class StepIndicatorScreen extends StatelessWidget {
  const StepIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileProcessBloc(),
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<ProfileProcessBloc, int>(
              builder: (context, state) {
                String appBarTitle = getTextForStep(state);
                return Text(
                  appBarTitle,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: tDarkColor),
                );
              },
            )),
        body: Column(
          children: [
            BlocBuilder<ProfileProcessBloc, int>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FlutterStepIndicator(
                    list: steps,
                    onChange: (int index) {
                      //
                    },
                    page: state,
                    positiveColor: tPrimaryColor,
                    negativeColor: Colors.grey.withOpacity(0.1),
                    progressColor: tPrimaryColor,
                    division: 4,
                    height: 25,
                  ),
                );
              },
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  //
                },
                children: const [
                  PersonalInfoScreen(),
                  SelectionScreen(),
                  AddSocialMedia(),
                  ProfileCompleteScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> steps = ['Step 1', 'Step 2', 'Step 3', 'Step 4'];

String getTextForStep(int currentPageValue) {
  String text = '';
  switch (currentPageValue) {
    case 0:
      text = 'Profile Information';
      break;
    case 1:
      text = 'Select Your Interests';
      break;
    case 2:
      text = 'Social Media Accounts';
      break;
    case 3:
      text = 'Completed';
      break;
    default:
      text = '';
  }
  return text;
}
