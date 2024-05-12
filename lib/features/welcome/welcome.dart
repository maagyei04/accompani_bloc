import 'package:accompani_bloc/core/common_widgets/navigation_router/router.dart';
import 'package:accompani_bloc/core/constants/sizes.dart';
import 'package:accompani_bloc/core/constants/text_strings.dart';
import 'package:accompani_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:accompani_bloc/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/accompani_vid.mp4')
          ..initialize().then((_) async {
            _videoPlayerController.setLooping(true);
            await Future.delayed(const Duration(milliseconds: 100), () {
              _videoPlayerController.play();
            });
            setState(() {});
          });
  }

  void stopVideo() {
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: width,
              height: height,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 500),
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
          Container(
            color: Colors.black.withAlpha(50),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tWelcomeScreenTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        stopVideo();
                        goTo(context, const SignUpScreen());
                      },
                      child: const Text(
                        tGetStarted,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => goTo(context, const LoginScreen()),
                        child: const Text(
                          tLogin,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
