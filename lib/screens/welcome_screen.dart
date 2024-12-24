// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vibe_tunes/screens/music_home_screen.dart';
import 'package:vibe_tunes/screens/splash_screen.dart';
import 'package:vibe_tunes/utils/app_colors.dart';
import 'package:vibe_tunes/utils/app_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController viewController = PageController();
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(seconds: 1),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(seconds: 1),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  AppColors.gradientStart,
                  AppColors.gradientEnd
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView(
                      controller: viewController,
                      onPageChanged: (value) {},
                      children: const [
                        WelcomePage(
                          title: "Welcome to vibeTunes",
                          imgPath: 'assets/images/music-notes-svgrepo-com.png',
                          description: "Your ultimate music experience awaits!",
                          image: Icons.music_note,
                        ),
                        WelcomePage(
                          title: "Explore Your Music",
                          imgPath: 'assets/images/music-folder-svgrepo-com.png',
                          description:
                              "Access all your favorite tunes from your device.",
                          image: Icons.library_music,
                        ),
                        WelcomePage(
                          title: "Control with Ease",
                          imgPath: 'assets/images/music-play-svgrepo-com.png',
                          description:
                              "Play, pause, and manage music with a single tap.",
                          image: Icons.play_circle_fill,
                        ),
                        WelcomePage(
                          title: "Stay in the Groove",
                          imgPath:
                              'assets/images/video-player-music-play-multimedia-svgrepo-com.png',
                          description: "Enjoy seamless background playback.",
                          image: Icons.notifications_active,
                          showButton: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 120.0),
                    child: SmoothPageIndicator(
                      controller: viewController,
                      count: 4,
                      onDotClicked: (index) => viewController.jumpToPage(index),
                      effect: const WormEffect(
                          activeDotColor: AppColors.accent,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 2,
                          dotHeight: 12,
                          dotWidth: 12,
                          spacing: 16,
                          dotColor: AppColors.textSecondary),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends ConsumerWidget {
  final String title;
  final String imgPath;
  final String description;
  final IconData image;
  final bool showButton;

  const WelcomePage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.imgPath,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final markComplete = ref.read(markOnboardingCompleteProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgPath,
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                fontFamily: Appfonts.aristaBold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
                fontSize: 24,
                color: AppColors.textSecondary,
                fontFamily: Appfonts.arista),
            textAlign: TextAlign.center,
          ),
          if (showButton) const SizedBox(height: 40),
          if (showButton)
            GestureDetector(
              onTap: () async {
                var sharedPreff = await SharedPreferences.getInstance();
                sharedPreff.setBool(SplashScreenState.userWelcomeKey, true);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MusicHomeScreen(),
                    ));
              },
              child: Container(
                height: 60,
                width: 240,
                decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: Appfonts.aristaBold),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
