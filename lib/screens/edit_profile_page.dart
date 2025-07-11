import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/Styles/text_styles.dart';
import 'package:islamicinstapp/Provider/edit_profile_provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFDEB), // Full background color
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.25,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image with overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF033941).withOpacity(0.8),
                          const Color(0xFF033941).withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/postimage3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Back button
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFFEFDEB), // Matching background
              child: Column(
                children: [
                  // Profile image with connection to header
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Connection curve
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEFDEB),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                      ),

                      // Profile image with shadow - now more visible
                      Transform.translate(
                        offset: const Offset(0, -50),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFEFDEB),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            border: Border.all(
                              color: const Color(0xFF033941),
                              width: 3,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Profile image - now properly visible
                              ClipOval(
                                child: Image.asset(
                                  provider.profileImage,
                                  fit: BoxFit.cover,
                                  width: 114,
                                  height: 114,
                                ),
                              ),

                              // Camera icon
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // Add image picker functionality here
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF033941),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Form content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyles.editProfileTitleText(context)
                                .copyWith(color: const Color(0xFF033941)),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Name Field
                        Text(
                          'Name',
                          style: TextStyles.editProfileLabelText(context)
                              .copyWith(color: const Color(0xFF033941)),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            initialValue: provider.name,
                            onChanged: (value) => provider.updateName(value),
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFEFDEB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Username Field
                        Text(
                          'Username',
                          style: TextStyles.editProfileLabelText(context)
                              .copyWith(color: const Color(0xFF033941)),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            initialValue: provider.username,
                            onChanged: (value) => provider.updateUsername(value),
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFEFDEB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Bio Field
                        Text(
                          'Bio',
                          style: TextStyles.editProfileLabelText(context)
                              .copyWith(color: const Color(0xFF033941)),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            initialValue: provider.bio,
                            onChanged: (value) => provider.updateBio(value),
                            style: const TextStyle(color: Colors.black),
                            maxLines: 3,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFFEFDEB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Save Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => provider.saveChanges(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF033941),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 3,
                            ),
                            child: Text(
                              'Save Changes',
                              style: TextStyles.editProfileButtonText(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}