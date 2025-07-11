import 'package:flutter/material.dart';
import 'package:islamicinstapp/Provider/post_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

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
    return ChangeNotifierProvider(
      create: (_) => PostDetailProvider(),
      child: Scaffold(
        backgroundColor: AppColors.homeBackground,
        bottomNavigationBar: const CustomBottomNavBar(),
        body: const _PostDetailContent(),
      ),
    );
  }
}

class _PostDetailContent extends StatelessWidget {
  const _PostDetailContent();

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostDetailProvider>(context);
    final community = postProvider.communityData;

    return DefaultTabController(
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
                      image: AssetImage('assets/images/postdetail1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // SPACE FOR LOGO TO OVERLAP
                const SizedBox(height: 60),

                // STATS + NAME + TABS
                Column(
                  children: [
                    const SizedBox(height: 10),
                    const SizedBox(height: 90),

                    // NAME
                    Text(
                      community['name'] as String,
                      style: TextStyles.postDetailTitleText(context),
                    ),

                    const SizedBox(height: 20),

                    // TAB BAR
                    Container(
                      color: AppColors.homeBackground,
                      child: const TabBar(
                        labelColor: AppColors.communityDropdown,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: AppColors.communityDropdown,
                        tabs: [
                          Tab(text: 'Posts'),
                          Tab(text: 'Programs'),
                          Tab(text: 'About'),
                        ],
                      ),
                    ),

                    // TAB CONTENT
                    SizedBox(
                      height: 500,
                      child: TabBarView(
                        children: [
                          _buildPostsTab(community['posts'] as List<String>),
                          _buildProgramsTab(community['programs'] as List<String>),
                          _buildAboutTab(context,community),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // LOGO AND STATS
            Positioned(
              top: 200,
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
                        style: TextStyles.postDetailStatValueText(context),
                      ),
                      Text(
                        'Followers',
                        style: TextStyles.postDetailStatLabelText(context),
                      ),
                    ],
                  ),

                  const SizedBox(width: 30),

                  // Profile Logo
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: AppColors.communityDropdown,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.homeBackground,
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
                        style: TextStyles.postDetailStatValueText(context),
                      ),
                      Text(
                        'Following',
                        style: TextStyles.postDetailStatLabelText(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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

  Widget _buildAboutTab(BuildContext context, Map<String, dynamic> community) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Us Section
          _buildSection(
            context: context,
            title: 'About Us',
            content: Text(
              community['description']!,
              style: TextStyles.postDetailSectionContentText(context),
            ),
          ),

          const SizedBox(height: 16),

          // Website Section
          _buildSection(
            context: context,
            title: 'Website',
            content: GestureDetector(
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
          ),

          const SizedBox(height: 16),

          // Directions Section
          _buildSection(
            context: context,
            title: 'Directions',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  community['address']!,
                  style: TextStyles.postDetailSectionContentText(context),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.map,
                      size: 50,
                      color: AppColors.communityDropdown,
                    ),
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
              children: [
                Text(
                  'Leaders',
                  style: TextStyles.postDetailSectionTitleText(context),
                ),
                Text(
                  'View More',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.communityDropdown,
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
                          color: AppColors.communityAvatar,
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
                        style: TextStyles.postDetailLeaderNameText(context),
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

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.communityDropdown.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.postDetailSectionTitleText(context),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}