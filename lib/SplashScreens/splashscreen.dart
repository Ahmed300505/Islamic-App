import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:islamicinstapp/SplashScreens/linksPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool showDescription = false;
  bool showSlider = false;
  int currentPage = 0;
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> sliderItems = [
    {
      'title': 'Learn about Islam and connect with the community',
      'animation': 'assets/images/lotie.json',
      'image': 'https://images.unsplash.com/photo-1564121211835-e88c852648ab',
    },
    {
      'title': 'Never miss your prayers with our accurate prayer times',
      'animation': 'assets/images/lotie.json',
      'image': 'https://images.unsplash.com/photo-1519817650390-64a93db51149',
    },
    {
      'title': 'Access authentic Quran and Hadith collections',
      'animation': 'assets/images/lotie.json',
      'image': 'https://images.unsplash.com/photo-1541252260730-0412e8e2108e',
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 700;
    final isVerySmallScreen = screenHeight < 600;
    final isNarrowScreen = screenWidth < 350;

    return Scaffold(
      backgroundColor: const Color(0xFF094B4A),
      body: showSlider ? _buildSliderScreen(
        isSmallScreen: isSmallScreen,
        isVerySmallScreen: isVerySmallScreen,
        isNarrowScreen: isNarrowScreen,
        screenHeight: screenHeight,
      ) : _buildSplashScreen(
        isSmallScreen: isSmallScreen,
        isVerySmallScreen: isVerySmallScreen,
      ),
    );
  }

  Widget _buildSplashScreen({
    required bool isSmallScreen,
    required bool isVerySmallScreen,
  }) {
    return GestureDetector(
      onTap: () {
        if (!showDescription) {
          _animationController.forward();
          setState(() => showDescription = true);
        } else {
          setState(() => showSlider = true);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'app-logo',
              child: Container(
                width: isVerySmallScreen ? 140 : 180,
                height: isVerySmallScreen ? 140 : 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1564121211835-e88c852648ab'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: isVerySmallScreen ? 15 : 20),
            Text(
              'Islamic App',
              style: TextStyle(
                fontSize: isVerySmallScreen ? 24 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            if (showDescription)
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isVerySmallScreen ? 20 : 30,
                    left: isVerySmallScreen ? 30 : 40,
                    right: isVerySmallScreen ? 30 : 40,
                  ),
                  child: Text(
                    'A complete app for Muslims to learn about Islam, prayer times, Quran and more',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isVerySmallScreen ? 14 : 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderScreen({
    required bool isSmallScreen,
    required bool isVerySmallScreen,
    required bool isNarrowScreen,
    required double screenHeight,
  }) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: sliderItems.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) => setState(() => currentPage = index),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isNarrowScreen ? 15 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isVerySmallScreen ? 50 : 100),
                  // Left-aligned heading
                  Row(
                    children: [
                      SizedBox(width: isNarrowScreen ? 8 : 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sliderItems[index]['title']!,
                              style: TextStyle(
                                fontSize: isNarrowScreen ? 28 : 35,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFDBE5D0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isVerySmallScreen ? 60 : 120),
                  // Circular container with Lottie animation
                  Center(
                    child: Container(
                      width: isVerySmallScreen ? 200 : 250,
                      height: isVerySmallScreen ? 200 : 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(
                          color: const Color(0xFFD4AF37).withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Lottie.asset(
                          sliderItems[index]['animation']!,
                          fit: BoxFit.contain,
                          repeat: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // Page indicators
        Positioned(
          bottom: screenHeight * 0.35,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              sliderItems.length,
                  (index) => Container(
                margin: EdgeInsets.symmetric(
                    horizontal: isNarrowScreen ? 8 : 19),
                width: currentPage == index
                    ? (isNarrowScreen ? 16 : 20)
                    : (isNarrowScreen ? 8 : 10),
                height: isNarrowScreen ? 8 : 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: currentPage == index
                      ? const Color(0xFF033941)
                      : Colors.white54,
                ),
              ),
            ),
          ),
        ),
        // Continue button
        Positioned(
          bottom: screenHeight * 0.2,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDBE5D0),
                foregroundColor: const Color(0xFFDBE5D0),
                padding: EdgeInsets.symmetric(
                  horizontal: isNarrowScreen ? 60 : 100,
                  vertical: isVerySmallScreen ? 12 : 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              onPressed: () {
                if (currentPage < sliderItems.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AuthSelectionPage()),
                  );
                }
              },
              child: Text(
                currentPage < sliderItems.length - 1 ? 'Continue' : 'Get Started',
                style: TextStyle(
                  fontSize: isNarrowScreen ? 18 : 22,
                  color: const Color(0xFF033941),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}