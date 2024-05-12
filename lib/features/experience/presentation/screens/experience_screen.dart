import 'package:accompani_bloc/features/experience/presentation/widgets/trip_card.dart';
import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Trips", style: Theme.of(context).textTheme.displayLarge),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (_, index) {
                  return TripCard(
                    widthSize: widthSize,
                    description: ' trip[index].description',
                    title: 'trip[index].title',
                    name: 'trip[index].host',
                    verified: true,
                  );
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: () {
                  //Get.to(() => const GetTripStarted());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_rounded),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Create A New Trip',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ));
  }
}
