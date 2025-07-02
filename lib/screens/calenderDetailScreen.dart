import 'package:flutter/material.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';

class EventDetailScreen extends StatelessWidget {
  final DateTime selectedDate;

   EventDetailScreen({Key? key, required this.selectedDate}) : super(key: key);

  static const backgroundColor = Color(0xFFFCF5DB);
  static const primaryColor = Color(0xFF063A39); // Darker shade
  static const textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 375;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with connected banner
              Stack(
                children: [
                  // Banner image extended to header
                  Container(
                    height: isSmallScreen ? 200 : 240,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/islamicevent.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Back button and title with semi-transparent background
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, isSmallScreen ? 8 : 16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor.withOpacity(0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white, size: isSmallScreen ? 24 : 28),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
              // Info Row (Location | Date | Register)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Location Section
                    Expanded(
                      child: Column(
                        children: [
                          Icon(Icons.location_on, color: primaryColor, size: 28),
                          const SizedBox(height: 4),
                          Text(
                            'Masjid Al-Haram',
                            style: TextStyle(
                              color: textColor,
                              fontSize: isSmallScreen ? 12 : 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    // Vertical dotted divider
                    Container(
                      height: 60,
                      width: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: primaryColor,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30,),
                    SizedBox(
                      width: 70, // Small width
                      height: 60, // Small height
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            // Header (Month)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: const BoxDecoration(
                                color: Color(0xFF094B4A),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'MAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            // Body (Day)
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF094B4A).withOpacity(0.8),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    selectedDate.day.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Container(
                      height: 60,
                      width: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: primaryColor,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),

                    // Register Section
                    Expanded(
                      child: Column(
                        children: [
                          Icon(Icons.event_available, color: primaryColor, size: 28),
                          const SizedBox(height: 4),
                          Text(
                            'Register',
                            style: TextStyle(
                              color: textColor,
                              fontSize: isSmallScreen ? 12 : 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    '6:00 - 8:00 PM',
                    style: TextStyle(
                      color: textColor,
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                child: Container(
                  width: 599,
                  padding: const EdgeInsets.all(16), // padding inside the box
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // light grey background
                    borderRadius: BorderRadius.circular(16), // rounded corners (16 for softer corners)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          color: textColor,
                          fontSize: isSmallScreen ? 18 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Join us for a powerful evening exploring the profound and '
                            'timeless legacy of the Prophet. This event will provide '
                            'an opportunity to reflect on the life, teachings, and '
                            'enduring impact of the Prophet Muhammad through a '
                            'grounded and meaningful lens.',
                        style: TextStyle(
                          color: textColor.withOpacity(0.8),
                          fontSize: isSmallScreen ? 14 : 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(isSmallScreen ? 12 : 24, 16, isSmallScreen ? 12 : 24, 16),
                child: Container(
                  padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Text(
                        'People Attending',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 10 : 12),

                      // Row with avatars + 75+ + Connect button
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Flexible avatar row - uses Expanded so it shrinks nicely on small screens
                          Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(6, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      radius: isSmallScreen ? 16 : 20,
                                      backgroundImage: AssetImage('assets/images/profile_${index + 1}.jpg'),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // "75+" text
                          Flexible(
                            flex: 1,
                            child: Text(
                              '75+',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: isSmallScreen ? 13 : 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const Spacer(),

                          // Connect button - wrapped in Flexible to prevent overflow
                          Flexible(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                // your connect logic here
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSmallScreen ? 10 : 12,
                                  vertical: isSmallScreen ? 6 : 8,
                                ),
                                backgroundColor: EventDetailScreen.primaryColor,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Connect',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 11 : 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}