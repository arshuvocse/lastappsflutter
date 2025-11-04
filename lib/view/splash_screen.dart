
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => GoRouter.of(context).go('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3D8A),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'e-program',
              textStyle: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              speed: const Duration(milliseconds: 200),
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
    );
  }
}
