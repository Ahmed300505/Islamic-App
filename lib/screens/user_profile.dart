import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/edit_profile_page.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> with SingleTickerProviderStateMixin {
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
      'image': 'https://images.unsplash.com/photo-1564121211835-e88c852648ab',
      'name': 'GroundedTwinCities',
      'description': 'A community dedicated to Islamic learning and brotherhood in the Twin Cities area.',
      'website': 'https://groundedtwincities.com',
      'address': '123 Islamic Center, Minneapolis, MN 55401',
      'members': '2000',
      'following': '36',
      'leaders': [
        {'name': 'Brother Ahmed', 'role': 'Imam'},
        {'name': 'Sister Fatima', 'role': 'Organizer'},
        {'name': 'Brother Yusuf', 'role': 'Treasurer'},
        {'name': 'Sister Aisha', 'role': 'Event Coordinator'},
        {'name': 'Brother Ali', 'role': 'Volunteer'},
      ],
      'posts': [
        'https://images.unsplash.com/photo-1498837167922-ddd27525d352',
        'https://images.unsplash.com/photo-1564121211835-e88c852648ab',
        'https://images.unsplash.com/photo-1519817650390-64a93db51149',
        'https://images.unsplash.com/photo-1541252260730-0412e8e2108e',
        'https://images.unsplash.com/photo-1541252260730-0412e8e2108e',
        'https://images.unsplash.com/photo-1541252260730-0412e8e2108e',
      ],
      'programs': [
        'https://images.unsplash.com/photo-1498837167922-ddd27525d352',
        'https://images.unsplash.com/photo-1564121211835-e88c852648ab',
        'https://images.unsplash.com/photo-1519817650390-64a93db51149',
        'https://images.unsplash.com/photo-1541252260730-0412e8e2108e',
      ],
    };

    return Scaffold(
      backgroundColor: const Color(0xFFFEFDEB),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  // COVER PHOTO
                  Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1498837167922-ddd27525d352',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // SPACE FOR LOGO TO OVERLAP
                  const SizedBox(height: 160),

                  // COMMUNITY NAME
                  Text(
                    'User',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF033941),
                    ),
                  ),
                  Text(
                    '@User300505',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF033941),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Share your favourite quran verse',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF033941),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Edit Profile Button (medium width)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditProfilePage()),
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 280,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                            ),
                            child: const Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Settings Icon
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1.5),
                            borderRadius: BorderRadius.circular(10), // Changed from circle to radius 10
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.settings, color: Colors.green, size: 18),
                            onPressed: () {
                              // Handle settings tap
                            },
                            padding: EdgeInsets.zero,
                          ),
                        ),

                      ],
                    ),
                  ),


                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'My Communities:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF033941),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (community['leaders'] as List).length,
                      itemBuilder: (context, index) {
                        final leader = (community['leaders'] as List)[index] as Map<String, String>;
                        return Container(
                          width: 90,
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Container(
                                width: 140,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6D8467),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Text(
                                    leader['name']!.split(' ').map((e) => e[0]).join(),
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
                              Text(
                                leader['role']!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Awliya:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF033941),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (community['leaders'] as List).length,
                      itemBuilder: (context, index) {
                        final leader = (community['leaders'] as List)[index] as Map<String, String>;
                        return Container(
                          width: 90,
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Container(
                                width: 140,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6D8467),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Text(
                                    leader['name']!.split(' ').map((e) => e[0]).join(),
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
                              Text(
                                leader['role']!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              // PROFILE PICTURE - Positioned over image
              Positioned(
                top: 180, // same as before to sit at image bottom
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
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        color: const Color(0xFF033941),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFEFDEB),
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
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
            color: Color(0xFF033941),
          ),
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
}