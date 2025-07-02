import 'package:flutter/material.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';

class PostDetailPage extends StatefulWidget {
  final String postId;

  const PostDetailPage({super.key, required this.postId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Mock data - in a real app you would fetch this based on postId
    final community = {
      'image':'assets/images/event.jpg',
      'name': 'GroundedTwinCities',
      'description': 'A community dedicated to Islamic learning and brotherhood in the Twin Cities area.',
      'website': 'https://groundedtwincities.com',
      'address': '123 Islamic Center, Minneapolis, MN 55401',
      'members': '2000',
      'following': '48',
      'leaders': [
        {'name': 'Brother Ahmed', 'role': 'Imam'},
        {'name': 'Sister Fatima', 'role': 'Organizer'},
        {'name': 'Brother Yusuf', 'role': 'Treasurer'},
        {'name': 'Sister Aisha', 'role': 'Event Coordinator'},
        {'name': 'Brother Ali', 'role': 'Volunteer'},
      ],
      'posts': [
        'assets/images/postimage1.jpg',
        'assets/images/postimage2.jpg',
        'assets/images/postimage3.jpg',
        'assets/images/postimage1.jpg',
        'assets/images/postimage2.jpg',
        'assets/images/postimage3.jpg',
      ],
      'programs': [
        'assets/images/postimage1.jpg',
        'assets/images/postimage2.jpg',
        'assets/images/postimage3.jpg',
        'assets/images/postimage1.jpg',
        'assets/images/postimage2.jpg',
        'assets/images/postimage3.jpg',
      ],
    };

    return Scaffold(
      backgroundColor: const Color(0xFFFEFDEB),
      bottomNavigationBar: CustomBottomNavBar(),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // COVER PHOTO
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/islamicevent2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // SPACE FOR LOGO TO OVERLAP
                  const SizedBox(height: 60),

                  // STATS + NAME + TABS
                  Column(
                    children: [
                      // FOLLOWERS / MEMBERS
                      const SizedBox(height: 10),
                      SizedBox(height: 90,),

                      // NAME
                      Text(
                        community['name'] as String,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF033941),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // TAB BAR
                      Container(
                        color: const Color(0xFFFEFDEB),
                        child: const TabBar(
                          labelColor: Color(0xFF033941),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Color(0xFF033941),
                          tabs: [
                            Tab(text: 'Posts'),
                            Tab(text: 'Programs'),
                            Tab(text: 'About'),
                          ],
                        ),
                      ),
                      // TAB CONTENT
                      Container(
                        height: 500, // Adjust based on content
                        child: TabBarView(
                          children: [
                            _buildPostsTab(community['posts'] as List<String>),
                            _buildProgramsTab(community['programs'] as List<String>),
                            _buildAboutTab(community),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // LOGO — Positioned over image
// PROFILE PICTURE + STATS (Horizontally aligned with logo)
              Positioned(
                top: 200, // same as before to sit at image bottom
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Followers (left)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text(
                          '2000k',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF033941),
                          ),
                        ),
                        const Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,

                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 30),

                    // Profile Logo
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFF033941),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFEFDEB),
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          community['image'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 30),

                    // Following (right)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Text(
                          community['following'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF033941),
                          ),
                        ),
                        const Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF033941)),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPostsTab(List<String> images) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildProgramsTab(List<String> images) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.5,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildAboutTab(Map<String, dynamic> community) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Us Section48 f0
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF033941).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF033941)),
                ),
                const SizedBox(height: 8),
                Text(
                  community['description']!,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF033941)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Website Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF033941).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Website',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF033941)),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Handle website tap
                  },
                  child: Text(
                    community['website']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Directions Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF033941).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Directions',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF033941)),
                ),
                const SizedBox(height: 8),
                Text(
                  community['address']!,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF033941)),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(Icons.map, size: 50, color: Color(0xFF033941)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Leaders Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Leaders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF033941),
                  ),
                ),
                Text(
                  'View More',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF033941),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: community['leaders'].length,
              itemBuilder: (context, index) {
                final leader = community['leaders'][index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6D8467),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            leader['name'].toString().split(' ').map((e) => e[0]).join(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF033941),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        leader['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF033941),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 69),
        ],
      ),
    );
  }
}