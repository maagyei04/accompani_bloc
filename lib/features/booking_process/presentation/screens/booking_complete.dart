import 'package:accompani_bloc/core/common_widgets/rive/rive.dart';
import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/nav_menu.dart';
import 'package:flutter/material.dart';

class BookingComplete extends StatelessWidget {
  const BookingComplete({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const RiveWidget(
              asset: 'assets/rive/success.riv',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Your Request Has Been Sent To Your Accompani',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 180, 180),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      const Icon(Icons.verified_rounded, color: tDarkColor),
                      const SizedBox(width: 10.0),
                      Text(
                        'Your booking process is almost complete, wait Accompani confirmation',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      const Icon(Icons.verified_rounded, color: tDarkColor),
                      const SizedBox(width: 10.0),
                      Text(
                        'Proceed to make payment after Accompani has accepted request',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      const Icon(Icons.verified_rounded, color: tDarkColor),
                      const SizedBox(width: 10.0),
                      Text(
                        'You can continue to message Accompani for further info',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                //Get.offAll(() => const NavMenu());
              },
              child: const Text('Done')),
        ),
      ),
    );
  }
}
