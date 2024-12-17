import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_tunes/screens/welcome_screen.dart';

void main() {
  runApp(const ProviderScope(child: VibeTunesApp()));
}

class VibeTunesApp extends StatelessWidget {
  const VibeTunesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const WelcomeScreen(),
    );
  }
}
