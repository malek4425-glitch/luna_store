import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE6FF),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xFF8B5CF6),
                borderRadius: BorderRadius.circular(35),
              ),

              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 75,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            // App Name
            const Text(
              'Luna Store',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF352450),
              ),
            ),

            const SizedBox(height: 10),

            // Subtitle
            const Text(
              'Shop Smart • Live Better',
              style: TextStyle(fontSize: 16, color: Color(0xFF8B5CF6)),
            ),

            const SizedBox(height: 40),

            // Loading
            const CircularProgressIndicator(color: Color(0xFF8B5CF6)),
          ],
        ),
      ),
    );
  }
}

// Temporary next screen
class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEDE6FF),
      body: Center(
        child: Text(
          'Welcome to Luna Store 🌙',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF352450),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
