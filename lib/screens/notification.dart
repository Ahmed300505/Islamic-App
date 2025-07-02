import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/home_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const backgroundColor = Color(0xFFFCF5DB);
  static const primaryColor = Color(0xFF094B4A);
  static const textColor = Colors.black;
  static const borderColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 375;
    final isMediumScreen = screenSize.width >= 375 && screenSize.width < 600;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              size: isSmallScreen ? 20 : 24,
              color: Colors.black),
          onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            }
            ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : (isMediumScreen ? 20 : 22),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 12.0 : (isMediumScreen ? 16.0 : 20.0),
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today Section
            _buildSectionHeader('Today', isSmallScreen),
            const SizedBox(height: 8),
            _buildNotificationList(
              count: 4,
              isSmallScreen: isSmallScreen,
              isMediumScreen: isMediumScreen,
              textColor: textColor,
            ),

            const SizedBox(height: 16),

            // This Week Section
            _buildSectionHeader('This Week', isSmallScreen),
            const SizedBox(height: 8),
            _buildNotificationList(
              count: 4,
              isSmallScreen: isSmallScreen,
              isMediumScreen: isMediumScreen,
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isSmallScreen) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 4.0 : 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: isSmallScreen ? 18 : 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildNotificationList({
    required int count,
    required bool isSmallScreen,
    required bool isMediumScreen,
    required Color textColor,
  }) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: count,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: borderColor,
      ),
      itemBuilder: (context, index) {
        return _buildNotificationItem(
          isSmallScreen: isSmallScreen,
          isMediumScreen: isMediumScreen,
          textColor: textColor,
          index: index,
        );
      },
    );
  }

  Widget _buildNotificationItem({
    required bool isSmallScreen,
    required bool isMediumScreen,
    required Color textColor,
    required int index,
  }) {
    final notifications = [
      {
        'title': 'New Prayer Times Update',
        'subtitle': 'Updated prayer times for your location',
        'image': 'assets/images/event.jpg', // Your image path
      },
      {
        'title': 'Islamic Event Reminder',
        'subtitle': 'Weekly Tafseer session starting soon',
        'image': 'assets/images/event2.jpg',
      },
      {
        'title': 'App Update Available',
        'subtitle': 'New version 2.3.1 ready to download',
        'image': 'assets/images/event3.jpg',
      },
      {
        'title': 'Community Message',
        'subtitle': 'You have 3 new messages in the group',
        'image': 'assets/images/event4.jpg',
      },
    ];

    final notification = notifications[index % notifications.length];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: primaryColor.withOpacity(0.1),
        highlightColor: primaryColor.withOpacity(0.05),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 4.0 : 8.0,
            vertical: isSmallScreen ? 12.0 : 14.0,
          ),
          child: Row(
            children: [
              // Image icon
              Container(
                width: isSmallScreen ? 42 : 48,
                height: isSmallScreen ? 42 : 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(notification['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Notification Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification['title']!,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : (isMediumScreen ? 15 : 16),
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification['subtitle']!,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 13,
                        color: textColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}