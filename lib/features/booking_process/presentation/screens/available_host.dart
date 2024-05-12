import 'package:accompani_bloc/core/common_widgets/searchbar/search_bar.dart';
import 'package:accompani_bloc/core/constants/colors.dart';
import 'package:accompani_bloc/core/constants/image_strings.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/features/booking_process/presentation/screens/book_request.dart';
import 'package:accompani_bloc/features/booking_process/presentation/widgets/host_available_card.dart';
import 'package:flutter/material.dart';

class AvailableHosts extends StatelessWidget {
  AvailableHosts({super.key});

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
        centerTitle: true,
        title: const Text(
          'Available Hosts',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: tDarkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize - 15),
          child: Column(
            children: [
              TSearchContainer(width: screenWidth, text: 'New York'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      /*final tripp = TripModel(
                        title: trip.title,
                        description: trip.description,
                        activity: trip.activity,
                        destination: trip.destination,
                        arrivalDate: trip.arrivalDate,
                        cost: trip.cost,
                        guestAdded: trip.guestAdded,
                        status: trip.status,
                        purpose: trip.purpose,
                        host: user[index].userId!,
                        duration: trip.duration,
                      );
                      */

                      //Get.to(() => BookRequestScreen(), arguments: tripp);
                    },
                    child: HostCard(
                      pic: tWelcomeImage2,
                      userId: ' user[index].userId!',
                      screenWidth: screenWidth,
                      name: 'user[index].firstName + user[index].lastName,',
                      review: '24 Reviews',
                      rank: ' user[index].rank!',
                      rate: ' user[index].reviewRate!',
                      bio: 'user[index].bio,',
                      hostTimeJoined: '2 months hosting',
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
