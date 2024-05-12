import 'package:accompani_bloc/core/common_widgets/custom_dialogue/custom_dialogue.dart';
import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/image_strings.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/features/booking_process/presentation/screens/booking_complete.dart';
import 'package:accompani_bloc/features/booking_process/presentation/widgets/host_available_card.dart';
import 'package:accompani_bloc/nav_menu.dart';
import 'package:flutter/material.dart';

class BookRequestScreen extends StatelessWidget {
  BookRequestScreen({super.key});

  //final trip = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var screenWidth = mediaQuery.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {/*Get.back();*/},
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          'Request To Book',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HostCard(
                pic: tWelcomeImage,
                userId: 'Default',
                screenWidth: screenWidth,
                name: 'hgjhg',
                review: '24 Reviews',
                rank: 'Default',
                rate: 'Default',
                bio: 'user.bio',
                hostTimeJoined: '2 month hosting',
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Selected Activities',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learn & Explore Category',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              'Selected Activity: ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Container(
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Text(
                                'trip.activity',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //
                      },
                      child: const Text('Edit'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Details',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'trip.duration',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //
                      },
                      child: const Text('Edit'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          'trip.destination',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //
                      },
                      child: const Text('Edit'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Rates',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                width: screenWidth,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$79 * 5',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'Taxes',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$395.00',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '\$16.00',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text('\$411.00',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(tDefaultSize - 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  _showCustomDialog(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Cancel'),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      //UserRepository.instance.createTrip(trip);
                      // Get.offAll(() => const BookingComplete());
                    },
                    child: const Text('Request To Book')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Booking Accompani',
          content: 'Are you sure you want to cancel Booking a local guide?',
          widget: NavMenu(),
        );
      },
    );
  }
}
