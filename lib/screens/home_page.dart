import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/post_detail_page.dart';
import '../widgets/app_bar.dart';
import '../widgets/user_header.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCommunity = 'My Communities';
  final List<String> communities = [
    'My Communities',
    'GroundedTwinCities',
    'Islamic Study Group',
    'Quran Recitation'
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'id': '1',
      'communityName': 'GroundedTwinCities',
      'postText': 'Alhamdulillah we are pleased to invite you all to our eighth session of our Seerah Series...',
      'imageUrl': 'assets/images/postimage1.jpg',
      'likes': 24,
      'comments': 5,
      'isLiked': false,
      'isSaved': false,
    },
    {
      'id': '2',
      'communityName': 'Islamic Study Group',
      'postText': 'Join us this Friday for a special lecture on the life of Prophet Muhammad (PBUH)...',
      'imageUrl': 'assets/images/postimage2.jpg',
      'likes': 42,
      'comments': 12,
      'isLiked': true,
      'isSaved': true,
    },
    {
      'id': '3',
      'communityName': 'Quran Recitation',
      'postText': 'Weekly Quran recitation circle starts tomorrow at 7 PM. Bring your mus-hafs...',
      'imageUrl': 'https://assets/images/postimage3.jpg',
      'likes': 15,
      'comments': 3,
      'isLiked': false,
      'isSaved': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const UserHeaderSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFDEB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: const Color(0xFFFEFDEB),
                    value: selectedCommunity,
                    icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF033941)),
                    iconSize: 24,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF033941),
                      fontWeight: FontWeight.w600,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCommunity = newValue!;
                      });
                    },
                    items: communities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundColor: Color(0xFF033941),
                              child: Icon(Icons.group, size: 14, color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostCard(
                  postId: post['id'],
                  communityName: post['communityName'],
                  postText: post['postText'],
                  imageUrl: post['imageUrl'],
                  likes: post['likes'],
                  comments: post['comments'],
                  isLiked: post['isLiked'],
                  isSaved: post['isSaved'],
                  onLikePressed: () {
                    setState(() {
                      posts[index]['isLiked'] = !posts[index]['isLiked'];
                      posts[index]['likes'] = posts[index]['isLiked']
                          ? posts[index]['likes'] + 1
                          : posts[index]['likes'] - 1;
                    });
                  },
                  onSavePressed: () {
                    setState(() {
                      posts[index]['isSaved'] = !posts[index]['isSaved'];
                    });
                  },
                  onCommentPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailPage(postId: post['id']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}