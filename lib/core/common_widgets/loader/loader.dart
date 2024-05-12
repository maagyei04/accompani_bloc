import 'package:accompani_bloc/core/common_widgets/rive/rive.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:
          RiveWidget(asset: 'assets/rive/loading.riv', width: 150, height: 150),
    );
  }
}
