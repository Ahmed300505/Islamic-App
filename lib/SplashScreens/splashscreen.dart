import 'package:flutter/material.dart';
import 'package:islamicinstapp/Provider/splash_provider.dart';
import 'package:islamicinstapp/Styles/splash_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/SplashScreens/linksPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> sliderItems = [
    {
      'title': 'Learn about Islam and connect with the community',
      'animation': 'assets/images/lotie.json',
      'image': 'assets/images/splashscreen1.png',
    },
    {
      'title': 'Never miss your prayers with our accurate prayer times',
      'animation': 'assets/images/lotie.json',
      'image': 'assets/images/splash2.png',
    },
    {
      'title': 'Access authentic Quran and Hadith collections',
      'animation': 'assets/images/lotie.json',
      'image': 'assets/images/splash3.png',
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
    final splashProvider = Provider.of<SplashProvider>(context);

    return Scaffold(
      backgroundColor: SplashStyles.primaryColor,
      body: splashProvider.showSlider
          ? _buildSliderScreen(
        isSmallScreen: isSmallScreen,
        isVerySmallScreen: isVerySmallScreen,
        isNarrowScreen: isNarrowScreen,
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      )
          : _buildSplashScreen(
        isSmallScreen: isSmallScreen,
        isVerySmallScreen: isVerySmallScreen,
        isNarrowScreen: isNarrowScreen,
      ),
    );
  }

  Widget _buildSplashScreen({
    required bool isSmallScreen,
    required bool isVerySmallScreen,
    required bool isNarrowScreen,
  }) {
    final splashProvider = Provider.of<SplashProvider>(context, listen: false);
    final double logoSize = isVerySmallScreen
        ? (isNarrowScreen ? 120 : 140)
        : isSmallScreen
        ? 160
        : 180;

    return GestureDetector(
      onTap: () {
        if (!splashProvider.showDescription) {
          _animationController.forward();
          splashProvider.setShowDescription(true);
        } else {
          splashProvider.setShowSlider(true);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: 'app-logo',
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Main circular logo container
                    Container(
                      width: logoSize,
                      height: logoSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(logoSize / 2),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/elipse.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // U-shaped overlay image
                    Positioned(
                      child: Image.asset(
                        'assets/images/ulogo.png',
                        width: logoSize * 0.8,
                        height: logoSize * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: isVerySmallScreen ? 15 : 20),
            Text(
              'UMMAH LINK',
              style: SplashStyles.appTitleStyle(isVerySmallScreen),
            ),
            if (splashProvider.showDescription)
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: isVerySmallScreen ? 20 : 30,
                    left: isNarrowScreen ? 20 : 40,
                    right: isNarrowScreen ? 20 : 40,
                  ),
                  child: Text(
                    'A complete app for Muslims to learn about Islam, prayer times, Quran and more',
                    textAlign: TextAlign.center,
                    style: SplashStyles.descriptionTextStyle(isVerySmallScreen),
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
    required double screenWidth,
  }) {
    final splashProvider = Provider.of<SplashProvider>(context);

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: sliderItems.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) => splashProvider.setCurrentPage(index),
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: screenHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: isVerySmallScreen
                            ? screenHeight * 0.05
                            : screenHeight * 0.1),

                    // Title
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isNarrowScreen ? 20 : 30),
                      child: Text(
                        sliderItems[index]['title']!,
                        style: SplashStyles.sliderTitleStyle(
                            isNarrowScreen, isSmallScreen),
                      ),
                    ),

                    SizedBox(
                        height: isVerySmallScreen
                            ? screenHeight * 0.05
                            : screenHeight * 0.08),

                    // Image Container (removed border radius)
                    Center(
                      child: Container(
                        width: isVerySmallScreen
                            ? screenWidth * 0.9
                            : screenWidth * 0.8,
                        height: isVerySmallScreen
                            ? screenHeight * 0.4
                            : screenHeight * 0.45,
                        child: Image.asset(
                          sliderItems[index]['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(
                        height: isVerySmallScreen
                            ? screenHeight * 0.05
                            : screenHeight * 0.1),

                    // Page Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliderItems.length,
                            (index) => Container(
                          margin:
                          EdgeInsets.symmetric(horizontal: isNarrowScreen ? 6 : 8),
                          width: splashProvider.currentPage == index
                              ? (isNarrowScreen ? 16 : 20)
                              : (isNarrowScreen ? 8 : 10),
                          height: isNarrowScreen ? 8 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: splashProvider.currentPage == index
                                ? SplashStyles.darkColor
                                : Colors.white54,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: isVerySmallScreen ? 20 : 30),

                    // Continue Button
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isNarrowScreen ? 40 : 60),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: SplashStyles.getButtonStyle(),
                          onPressed: () {
                            if (splashProvider.currentPage < sliderItems.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AuthSelectionPage()),
                              );
                            }
                          },
                          child: Text(
                            splashProvider.currentPage < sliderItems.length - 1
                                ? 'Continue'
                                : 'Get Started',
                            style: SplashStyles.buttonTextStyle(isNarrowScreen),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: isVerySmallScreen ? 20 : 30),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}