import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/calenderDetailScreen.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  static const backgroundColor = Color(0xFFFCF5DB);
  static const primaryColor = Color(0xFF094B4A);
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AllEventsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 375;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Title & Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Local Events',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
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
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📅 Calendar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });

                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(color: primaryColor),
                  weekendTextStyle: TextStyle(color: primaryColor.withOpacity(0.8)),
                  outsideTextStyle: TextStyle(color: primaryColor.withOpacity(0.4)),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
                  formatButtonVisible: false,
                  leftChevronIcon: Icon(Icons.chevron_left, color: primaryColor),
                  rightChevronIcon: Icon(Icons.chevron_right, color: primaryColor),
                  titleCentered: true,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: primaryColor),
                  weekendStyle: TextStyle(color: primaryColor),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📋 Upcoming Events Section
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Column(
                  children: [
                    // Header with "Upcoming Events" and "View More"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upcoming Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(_createRoute());
                          },
                          child: Text(
                            'View More',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildEventCard('18', '6:00 PM - 8:00 PM', 'Community Gathering'),
                          _buildEventCard('20', '2:00 PM - 3:00 PM', 'Al-Amaan: Sisters Biweekly Halaqa'),
                          _buildEventCard('24', '7:00 PM - 8:30 PM', 'SMIC Masjid: Tafsir Halaqa'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String date, String time, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🗓️ Date Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // 🔲 Vertical Divider
          Container(
            width: 1.5,
            height: 50,
            color: Colors.white.withOpacity(0.4),
          ),

          const SizedBox(width: 12),

          // 📋 Event Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            EventDetailScreen(selectedDate: DateTime(23)),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        transitionDuration: const Duration(milliseconds: 400),
                      ),
                    );
                  },
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // 💾 Save Icon
          Icon(Icons.bookmark_border, color: Colors.white),
        ],
      ),
    );
  }

}
class AllEventsScreen extends StatelessWidget {

  static const primaryColor = Color(0xFF094B4A);

  final List<Map<String, String>> allEvents = [
    {'date': '18', 'time': '6:00 PM - 8:00 PM', 'title': 'Community Gathering'},
    {'date': '20', 'time': '2:00 PM - 3:00 PM', 'title': 'Al-Amaan: Sisters Biweekly Halaqa'},
    {'date': '24', 'time': '7:00 PM - 8:30 PM', 'title': 'SMIC Masjid: Tafsir Halaqa'},
    {'date': '26', 'time': '5:00 PM - 6:00 PM', 'title': 'Youth Quran Circle'},
    {'date': '28', 'time': '1:00 PM - 2:00 PM', 'title': 'Friday Khutbah Prep'},
    {'date': '30', 'time': '4:00 PM - 5:30 PM', 'title': 'Sisters Book Club'},
    {'date': '02', 'time': '6:00 PM - 7:30 PM', 'title': 'Ramadan Planning Session'},
    {'date': '04', 'time': '3:00 PM - 4:00 PM', 'title': 'Kids Islamic Quiz'},
    {'date': '06', 'time': '7:00 PM - 9:00 PM', 'title': 'Monthly Community Dinner'},
  ];

  @override
  Widget build(BuildContext context) {
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    };
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: const Text('All Upcoming Events', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: allEvents.length,
        itemBuilder: (context, index) {
          final event = allEvents[index];
          return _buildEventCard(event['date']!, event['time']!, event['title']!);
        },
      ),
    );
  }

  Widget _buildEventCard(String date, String time, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🗓️ Date Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              date,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 1.5,
            height: 50,
            color: Colors.white.withOpacity(0.4),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.bookmark_border, color: Colors.white),
        ],
      ),
    );
  }
}

