// ignore_for_file: avoid_print

import 'dart:async';

import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/features/experience/presentation/screens/experience_screen.dart';
import 'package:accompani_bloc/features/explore/presentation/screens/explore_screen.dart';
import 'package:accompani_bloc/features/inbox/presentation/screens/chat.dart';
import 'package:accompani_bloc/features/profile/presentaion/screens/profile_screen.dart';
import 'package:flutter/material.dart';

enum NavEvent { explore, experience, inbox, profile }

class NavBloc extends ChangeNotifier {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const ExploreScreen(),
    const ExperienceScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  late final StreamController<int> _selectedIndexController;
  Stream<int> get selectedIndexStream => _selectedIndexController.stream;

  late final StreamController<Widget> _currentScreenController;
  Stream<Widget> get currentScreenStream => _currentScreenController.stream;

  NavBloc() {
    _selectedIndexController = StreamController<int>.broadcast(
      sync: true,
      onListen: () {
        _selectedIndexController.add(_selectedIndex);
      },
    );

    _currentScreenController = StreamController<Widget>.broadcast(
      sync: true,
      onListen: () {
        _currentScreenController.add(_screens[_selectedIndex]);
      },
    );
  }

  void navigateTo(NavEvent event) {
    switch (event) {
      case NavEvent.explore:
        _selectedIndex = 0;
        break;
      case NavEvent.experience:
        _selectedIndex = 1;
        break;
      case NavEvent.inbox:
        _selectedIndex = 2;
        break;
      case NavEvent.profile:
        _selectedIndex = 3;
        break;
    }
    _selectedIndexController.add(_selectedIndex);
    _currentScreenController.add(_screens[_selectedIndex]);
  }

  @override
  void dispose() {
    _selectedIndexController.close();
    _currentScreenController.close();
    super.dispose();
  }
}

class NavMenu extends StatelessWidget {
  final NavBloc bloc = NavBloc();

  NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StreamBuilder<int>(
        initialData: 0,
        stream: bloc.selectedIndexStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox();

          return NavigationBar(
            backgroundColor: tWhiteColor,
            indicatorColor: tPrimaryColor.withOpacity(0.1),
            height: 65.0,
            elevation: 1,
            selectedIndex: snapshot.data!,
            onDestinationSelected: (index) {
              bloc.navigateTo(NavEvent.values[index]);
            },
            destinations: const [
              NavigationDestination(
                icon:
                    Icon(Icons.search_outlined, color: tDarkColor, size: 23.0),
                label: 'Explore',
              ),
              NavigationDestination(
                icon:
                    Icon(Icons.refresh_outlined, color: tDarkColor, size: 23.0),
                label: 'Experience',
              ),
              NavigationDestination(
                icon:
                    Icon(Icons.message_outlined, color: tDarkColor, size: 23.0),
                label: 'Inbox',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_3_outlined,
                    color: tDarkColor, size: 23.0),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
      body: StreamBuilder<Widget>(
        stream: bloc.currentScreenStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox();

          return snapshot.data!;
        },
      ),
    );
  }
}
