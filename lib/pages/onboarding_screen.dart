import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFFEDE6FF),

      pages: [
        PageViewModel(
          title: "Welcome to Luna Store",
          body: "Discover your favorite products and enjoy a wonderful shopping experience.",
          image: _buildImage(Icons.shopping_bag_outlined),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              color: Color(0xFF352450),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: Color(0xFF6B5A85), fontSize: 16),
          ),
        ),

        PageViewModel(
          title: "Find What You Love",
          body: "Explore a wide range of products and find everything you need in one place.",
          image: _buildImage(Icons.favorite_border),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              color: Color(0xFF352450),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: Color(0xFF6B5A85), fontSize: 16),
          ),
        ),

        PageViewModel(
          title: "Easy & Fast Shopping",
          body: "Shop easily, save your favorite items, and enjoy a simple shopping experience.",
          image: _buildImage(Icons.shopping_cart_outlined),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              color: Color(0xFF352450),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(color: Color(0xFF6B5A85), fontSize: 16),
          ),
        ),
      ],

      showSkipButton: true,

      skip: const Text("Skip", style: TextStyle(color: Color(0xFF8B5CF6))),

      next: const Icon(Icons.arrow_forward, color: Color(0xFF8B5CF6)),

      done: const Text(
        "Done",
        style: TextStyle(color: Color(0xFF8B5CF6), fontWeight: FontWeight.bold),
      ),

      dotsDecorator: DotsDecorator(
        activeColor: const Color(0xFF8B5CF6),
        color: const Color(0xFFD1C1F5),
        size: const Size(8, 8),
        activeSize: const Size(20, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      onSkip: () {
        _goToNextPage(context);
      },

      onDone: () {
        _goToNextPage(context);
      },
    );
  }

  Widget _buildImage(IconData icon) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(icon, size: 110, color: const Color(0xFF8B5CF6)),
    );
  }

  void _goToNextPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
