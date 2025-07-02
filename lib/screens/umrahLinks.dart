import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/home_page.dart';

class UmrahLinks extends StatefulWidget {
  const UmrahLinks({super.key});

  @override
  State<UmrahLinks> createState() => _UmrahLinksState();
}

class _UmrahLinksState extends State<UmrahLinks> {
  final List<Map<String, dynamic>> umrahLinks = [
    {'title': 'Preparation', 'selected': false},
    {'title': 'Packing List', 'selected': false},
    {'title': 'Travel Tips', 'selected': false},
    {'title': 'Makkah Guide', 'selected': false},
    {'title': 'Madinah Guide', 'selected': false},
    {'title': 'Duas', 'selected': false},
    {'title': 'Etiquette', 'selected': false},
    {'title': 'Travel Tips', 'selected': false},
    {'title': 'Makkah Guide', 'selected': false},
    {'title': 'Madinah Guide', 'selected': false},
    {'title': 'Duas Prayer', 'selected': false},
    {'title': 'Etiquette', 'selected': false},
    {'title': 'Travel Tips', 'selected': false},
    {'title': 'Makkah Guide', 'selected': false},
    {'title': 'Madinah Guide', 'selected': false},
    {'title': 'Duas Prayer', 'selected': false},
    {'title': 'Etiquette', 'selected': false},
    {'title': 'Preparation', 'selected': false},
    {'title': 'Packing List', 'selected': false},
    {'title': 'Travel Tips', 'selected': false},
    {'title': 'Makkah Guide', 'selected': false},
    {'title': 'Madinah Guide', 'selected': false},
    {'title': 'Duas Prayer', 'selected': false},
    {'title': 'Etiquette', 'selected': false},
    {'title': 'Travel Tips', 'selected': false},
    {'title': 'Makkah Guide', 'selected': false},
    {'title': 'Madinah Guide', 'selected': false},
    {'title': 'Duas Prayer', 'selected': false},
    {'title': 'Etiquette', 'selected': false},
    {'title': 'Travel Tips', 'selected': false},
    {'title': 'Makkah Guide', 'selected': false},
    {'title': 'Madinah Guide', 'selected': false},
    {'title': 'Duas Prayer', 'selected': false},
    {'title': 'Etiquette', 'selected': false},
  ];

  int get selectedCount => umrahLinks.where((item) => item['selected']).length;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    // Responsive calculations
    final bool isSmallScreen = screenWidth < 375;
    final bool isMediumScreen = screenWidth >= 375 && screenWidth < 600;
    final bool isLargeScreen = screenWidth >= 600;

    // Adjust values based on screen size
    final crossAxisCount = isSmallScreen ? 2 : (isMediumScreen ? 3 : 4);
    final buttonHeight = isSmallScreen
        ? screenHeight * 0.06
        : (isMediumScreen ? screenHeight * 0.055 : screenHeight * 0.05);
    final buttonPadding = isSmallScreen ? 6.0 : (isMediumScreen ? 8.0 : 10.0);
    final titleFontSize = isSmallScreen ? 20.0 : (isMediumScreen ? 22.0 : 24.0);
    final descriptionFontSize = isSmallScreen ? 12.0 : (isMediumScreen ? 13.0 : 14.0);
    final buttonFontSize = isSmallScreen ? 13.0 : (isMediumScreen ? 14.0 : 15.0);
    final continueButtonFontSize = isSmallScreen ? 16.0 : (isMediumScreen ? 17.0 : 18.0);

    return Scaffold(
      backgroundColor: const Color(0xFFFCF5DB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCF5DB),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.black,
              size: isSmallScreen ? 20 : (isMediumScreen ? 22 : 24)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Umrah Links',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: isSmallScreen ? 18 : (isMediumScreen ? 20 : 22),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: const Color(0xFF094B4A),
                fontWeight: FontWeight.bold,
                fontSize: isSmallScreen ? 14 : (isMediumScreen ? 15 : 16),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 12.0 : (isMediumScreen ? 16.0 : 24.0),
          vertical: isSmallScreen ? 12.0 : (isMediumScreen ? 16.0 : 20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interests',
              style: TextStyle(
                color: Colors.black,
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: isSmallScreen ? 4 : (isMediumScreen ? 6 : 8)),
            Text(
              'Select the topics you\'re interested in to get personalized Umrah resources and guidance for your spiritual journey.',
              style: TextStyle(
                color: const Color(0xFF094B4A),
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: isSmallScreen ? 16 : (isMediumScreen ? 20 : 24)),

            SizedBox(height: isSmallScreen ? 8 : (isMediumScreen ? 10 : 12)),

            // Grid of links
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: isSmallScreen ? 8 : (isMediumScreen ? 10 : 12),
                mainAxisSpacing: isSmallScreen ? 8 : (isMediumScreen ? 10 : 12),
                childAspectRatio: isSmallScreen ? 2.8 : (isMediumScreen ? 3.0 : 3.2),
              ),
              itemCount: umrahLinks.length,
              itemBuilder: (context, index) {
                return _buildLinkButton(
                  title: umrahLinks[index]['title']!,
                  isSelected: umrahLinks[index]['selected'],
                  onTap: () {
                    if (umrahLinks[index]['selected'] || selectedCount < 4) {
                      setState(() {
                        umrahLinks[index]['selected'] = !umrahLinks[index]['selected'];
                      });
                    }
                  },
                  height: buttonHeight,
                  padding: buttonPadding,
                  fontSize: buttonFontSize,
                );
              },
            ),

            SizedBox(height: isSmallScreen ? screenHeight * 0.03 : (isMediumScreen ? screenHeight * 0.04 : screenHeight * 0.05)),

            // Continue button (only shows when exactly 4 items are selected)
            if (selectedCount == 4) ...[
              Center(
                child: SizedBox(
                  width: isSmallScreen ? screenWidth * 0.9 : (isMediumScreen ? screenWidth * 0.85 : screenWidth * 0.8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF094B4A),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(isSmallScreen ? 10 : 12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isSmallScreen ? screenHeight * 0.016 : (isMediumScreen ? screenHeight * 0.017 : screenHeight * 0.018),
                      ),
                    ),
                    onPressed: () {
                      final selectedItems = umrahLinks
                          .where((item) => item['selected'] == true)
                          .map((item) => item['title'])
                          .toList();
                      debugPrint('Selected items: $selectedItems');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: continueButtonFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: isSmallScreen ? screenHeight * 0.01 : (isMediumScreen ? screenHeight * 0.015 : screenHeight * 0.02)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLinkButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    required double height,
    required double padding,
    required double fontSize,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      height: height,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF094B4A) : Color(0xFFFCF5DB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF094B4A) : Colors.grey.shade300,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF094B4A),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}