import 'package:flutter/material.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const backgroundColor = Color(0xFFFCF5DB);
  static const primaryColor = Color(0xFF094B4A);
  static const cardHeaderColor = Color(0xFF063332); // Darker shade
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 375;
    final isMediumScreen = screenWidth >= 375 && screenWidth < 600;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 16.0 : (isMediumScreen ? 20.0 : 24.0),
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            _buildSearchBar(isSmallScreen),

            const SizedBox(height: 24),

            // Trending Section
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Trending for You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildTrendingItems(),

            const SizedBox(height: 24),

            // Communities Section
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Communities Near You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 16),

            _buildCommunityCards(isSmallScreen, isMediumScreen),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isSmallScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 12.0 : 14.0,
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search, size: 28, color: primaryColor),
        ),
      ),
    );
  }

  Widget _buildTrendingItems() {
    final trendingItems = [
      {'icon': Icons.show_chart, 'text': 'Makkah Ziyarat Places'},
      {'icon': Icons.show_chart, 'text': 'Madinah Historical Sites'},
      {'icon': Icons.show_chart, 'text': 'Umrah Guide 2023'},
      {'icon': Icons.show_chart, 'text': 'Best Hotels Near Haram'},
      {'icon': Icons.show_chart, 'text': 'Islamic Lectures'},
      {'icon': Icons.show_chart, 'text': 'Quran Tafseer'},
      {'icon': Icons.show_chart, 'text': 'Dua Collections'},
    ];

    return Column(
      children: trendingItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Icon(item['icon'] as IconData,
                  color: primaryColor,
                  size: 28),
              const SizedBox(width: 12),
              Text(
                item['text'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCommunityCards(bool isSmallScreen, bool isMediumScreen) {
    final communities = [
      {
        'logo': 'assets/images/islamiclogo.png',
        'title': 'Makkah Muslim Community',
        'description': 'Active community for pilgrims in Makkah',
        'mainImage': 'assets/images/islamicevent.jpg',
        'mapImage': 'assets/images/map1.jpg',
        'mainImageTitle': 'Weekly Gathering',
        'mapTitle': 'Location',
      },
      {
        'logo': 'assets/images/islamiclogo2.png',
        'title': 'Madinah Study Circle',
        'description': 'Quran and Hadith study group',
        'mainImage': 'assets/images/islamicevent2.jpg',
        'mapImage': 'assets/images/map1.jpg',
        'mainImageTitle': 'Study Session',
        'mapTitle': 'Meeting Point',
      },
    ];

    return Column(
      children: communities.map((community) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.8), // Body color
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Card Header
              Container(
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                decoration: BoxDecoration(
                  color: cardHeaderColor.withOpacity(0.9), // Darker header
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                    topLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Row(
                  children: [
                    // Logo
                    Container(
                      width: isSmallScreen ? 40 : 48,
                      height: isSmallScreen ? 40 : 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(community['logo']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Title and Description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            community['title']!,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 16 : 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            community['description']!,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 13 : 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Card Body - Now in Row layout
              Padding(
                padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            community['mainImageTitle']!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              community['mainImage']!,
                              width: double.infinity,
                              height: isSmallScreen ? 120 : (isMediumScreen ? 150 : 180),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: isSmallScreen ? 12 : 16),

                    // Map Image Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            community['mapTitle']!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              community['mapImage']!,
                              width: double.infinity,
                              height: isSmallScreen ? 120 : (isMediumScreen ? 150 : 180),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}