import 'package:flutter/material.dart';
import 'package:vibe_tunes/utils/app_colors.dart';

class MusicHomeScreen extends StatelessWidget {
  const MusicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.gradientStart, AppColors.gradientEnd],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          highlightColor: AppColors.accent.withOpacity(0.4),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_rounded,
                            color: AppColors.accent,
                            size: 28,
                          )),
                      IconButton(
                          highlightColor: AppColors.accent.withOpacity(0.4),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppColors.accent,
                            size: 28,
                          ))
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
