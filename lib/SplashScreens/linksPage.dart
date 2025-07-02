import 'package:flutter/material.dart';
import 'package:islamicinstapp/AuthScreens/login.dart';
import 'package:islamicinstapp/screens/home_page.dart';

class AuthSelectionPage extends StatelessWidget {
  const AuthSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF094B4A), // Same color as your splash screen
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            // "Join the" text with stylish font
            const Text(
              'Join the',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            // Big "Link!" text
            Padding(
              padding: const EdgeInsets.only(left: 160),
              child: const Text(
                'Link!',
                style: TextStyle(
                  fontSize: 92,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 0.9,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            const SizedBox(height: 160),
            Center(
              child: TweenAnimationBuilder<Color?>(
                duration: const Duration(milliseconds: 500),
                tween: ColorTween(
                  begin: const Color(0xFF032E35).withOpacity(0.7), // Slightly transparent initial color
                  end: const Color(0xFF032E35), // Darker teal color you wanted
                ),
                builder: (BuildContext context, Color? value, Widget? child) {
                  return Container(
                    padding: const EdgeInsets.all(16), // Outer spacing
                    decoration: BoxDecoration(
                      color: const Color(0xFF094B4A).withOpacity(0.3), // Semi-transparent teal background
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Member Button
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: value, // Animated color
                              foregroundColor: const Color(0xFF094B4A), // Dark teal text
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: value!.withOpacity(0.8), // Border color
                                  width: 2,
                                ),
                              ),
                              elevation: 4,
                              shadowColor: value.withOpacity(0.5),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const LoginScreen()),
                              );
                            },
                            child: const Text(
                              'Member',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFDBE5D0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // Spacing with animation
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 300),
                          tween: Tween<double>(begin: 10, end: 30),
                          builder: (BuildContext context, double value, Widget? child) {
                            return SizedBox(width: value);
                          },
                        ),
                        // Leader Button
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: value, // Animated color
                              foregroundColor: const Color(0xFF094B4A), // Dark teal text
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: value.withOpacity(0.8), // Border color
                                  width: 2,
                                ),
                              ),
                              elevation: 4,
                              shadowColor: value.withOpacity(0.5),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Leader',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFDBE5D0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 300),
            // Clickable text
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                  },
                child: const Text(
                  'Already Apart of it?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Login button
            Center(
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Add your login navigation logic here
                  },
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Guest text
            const Center(
              child: Text(
                'Guest',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}