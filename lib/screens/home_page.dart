import 'package:flutter/material.dart';
import 'package:islamicinstapp/Provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/screens/post_detail_page.dart';
import '../widgets/app_bar.dart';
import '../widgets/user_header.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/post_card.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child:  _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const UserHeaderSection(),
          _buildCommunityDropdown(context),
          const SizedBox(height: 8),
          _buildPostsList(context),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _buildCommunityDropdown(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.homeBackground,
              value: homeProvider.selectedCommunity,
              icon: const Icon(Icons.arrow_drop_down, color: AppColors.communityDropdown),
              iconSize: 24,
              style: TextStyles.communityDropdownText(context),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  homeProvider.changeCommunity(newValue);
                }
              },
              items: homeProvider.communities.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.communityDropdown,
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
    );
  }


  Widget _buildPostsList(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final posts = homeProvider.posts;

    return Expanded(
      child: posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            postId: post.id,
            communityName: post.communityName,
            postText: post.content, // formerly 'postText'
            imageUrl: post.imageUrl ?? '', // fallback for null
            likes: post.likes,
            comments: post.comments,
            isLiked: false, // You can enhance with user-likes logic
            isSaved: false, // Same here
            onLikePressed: () {}, // Future enhancement
            onSavePressed: () {},
            onCommentPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(postId: post.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
