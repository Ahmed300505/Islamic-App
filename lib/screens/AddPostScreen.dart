import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/Styles/text_styles.dart';
import 'package:islamicinstapp/Provider/add_post_provider.dart';
import 'package:islamicinstapp/widgets/bottom_nav_bar.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 375;
    final provider = Provider.of<AddPostProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF033941),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 16 : 20,
                  vertical: isSmallScreen ? 8 : 10,
                ),
              ),
              onPressed: () => provider.submitPost(context),
              child: Text(
                'Post',
                style: TextStyles.addPostAppBarButtonText(context),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Community Dropdown
            Container(
              width: isSmallScreen ? 230 : 260,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFF033941),
                borderRadius: BorderRadius.circular(39),
                border: Border.all(color: Colors.grey[300]!),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: provider.selectedCommunity,
                hint: Text(
                  'Select a community',
                  style: TextStyles.addPostDropdownText(context),
                ),
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 24,
                ),
                dropdownColor: const Color(0xFF033941),
                style: TextStyles.addPostDropdownText(context),
                items: provider.communities.map((community) {
                  return DropdownMenuItem<String>(
                    value: community['name'],
                    child: Row(
                      children: [
                        Image.asset(
                          community['image'],
                          width: 24,
                          height: 24,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 24,
                              height: 24,
                              color: Colors.grey,
                            );
                          },
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            community['name'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.addPostDropdownText(context),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: provider.selectCommunity,
              ),
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              'Title',
              style: TextStyles.addPostLabelText(context),
            ),

            const SizedBox(height: 8),

            // Post Content Field
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: provider.postController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Connect with your community...',
                  hintStyle: TextStyles.addPostHintText(context),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Community images displayed below
            if (provider.selectedCommunity != null) ...[
              Text(
                'Selected Community:',
                style: TextStyles.addPostLabelText(context),
              ),
              const SizedBox(height: 8),
              Center(
                child: Image.asset(
                  provider.communities.firstWhere(
                          (c) => c['name'] == provider.selectedCommunity)['image'],
                  width: 120,
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 120,
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          'Image not found',
                          style: TextStyles.addPostHintText(context),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}