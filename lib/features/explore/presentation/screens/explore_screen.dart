import 'package:accompani_bloc/features/explore/presentation/widgets/explore_appbar.dart';
import 'package:accompani_bloc/features/explore/presentation/widgets/home_card.dart';
import 'package:accompani_bloc/features/explore/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var widthSize = mediaQuery.size.width;
    var heightSize = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ExploreAppBar(),
            SizedBox(
              height: 1210,
              child: PageView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
                        child: HomeCard(
                          widthSize: widthSize,
                          heightSize: heightSize,
                          picture: '',
                          userId: '',
                          name: "",
                          rank: '',
                          rate: '',
                          bio: '',
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: widthSize,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Me',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              'users[index].bio',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        width: widthSize,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Interests',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                //for (var interest in users[index].interests)
                                //InterestWidget(interest: interest),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widthSize - 40,
                        child: const Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("'s Reviews",
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                      SizedBox(
                        height: 180.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return ReviewCard(
                              widthSize: widthSize,
                              review:
                                  '“... Emily received us very well, showed us the whole place, very communicative, and made us super comfortable. She gave the best restaurant referrals too...”   ',
                              name: 'Charles',
                              time: '2 Weeks ago...',
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
