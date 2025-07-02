import 'package:flutter/material.dart';
import 'package:islamicinstapp/AuthScreens/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 700;
    final isVerySmallScreen = screenHeight < 600;
    final isNarrowScreen = screenWidth < 350;

    return Scaffold(
      backgroundColor: const Color(0xFF094B4A),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Register Form Container
                Container(
                  width: screenWidth * 0.9,
                  constraints: const BoxConstraints(maxWidth: 500),
                  margin: EdgeInsets.symmetric(
                      horizontal: isNarrowScreen ? 10 : 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5DC),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Logo
                      Transform.translate(
                        offset: Offset(0, isVerySmallScreen ? -25 : -40),
                        child: Container(
                          width: isVerySmallScreen ? 100 : 140,
                          height: isVerySmallScreen ? 100 : 140,
                          decoration: BoxDecoration(
                            color: const Color(0xFF094B4A),
                            borderRadius: BorderRadius.circular(70),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1564121211835-e88c852648ab'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Title and Sign In link
                      Padding(
                        padding: EdgeInsets.only(
                            top: isVerySmallScreen ? 5 : 15,
                            bottom: isVerySmallScreen ? 10 : 20),
                        child: Column(
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: isNarrowScreen ? 24 : 28,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF094B4A),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: isNarrowScreen ? 12 : 14),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: isNarrowScreen ? 12 : 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Form Fields
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: isNarrowScreen ? 15 : 20),
                        child: Column(
                          children: [
                            _buildTextField(
                              context: context,
                              hintText: 'Name',
                              icon: Icons.person,
                              isSmallScreen: isVerySmallScreen,
                            ),
                            SizedBox(height: isVerySmallScreen ? 8 : 12),
                            _buildTextField(
                              context: context,
                              hintText: 'Username',
                              icon: Icons.person_outline,
                              isSmallScreen: isVerySmallScreen,
                            ),
                            SizedBox(height: isVerySmallScreen ? 8 : 12),
                            _buildTextField(
                              context: context,
                              hintText: 'Email Address',
                              icon: Icons.email_outlined,
                              isSmallScreen: isVerySmallScreen,
                            ),
                            SizedBox(height: isVerySmallScreen ? 8 : 12),
                            _buildTextField(
                              context: context,
                              hintText: 'Password',
                              icon: Icons.lock_outline,
                              isSmallScreen: isVerySmallScreen,
                              isPassword: true,
                            ),
                            SizedBox(height: isVerySmallScreen ? 8 : 12),
                            _buildTextField(
                              context: context,
                              hintText: 'Confirm Password',
                              icon: Icons.lock_outline,
                              isSmallScreen: isVerySmallScreen,
                              isPassword: true,
                            ),
                          ],
                        ),
                      ),

                      // Register Button
                      Padding(
                        padding: EdgeInsets.all(isVerySmallScreen ? 12 : 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF094B4A),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: isVerySmallScreen ? 12 : 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: isNarrowScreen ? 16 : 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Terms and Privacy text
                Padding(
                  padding: EdgeInsets.only(
                      top: isVerySmallScreen ? 15 : 20,
                      left: 20,
                      right: 20),
                  child: Column(
                    children: [
                      Text(
                        'By Creating an account you agree to our',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isNarrowScreen ? 12 : 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Terms Of Service',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isNarrowScreen ? 12 : 14),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'and',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isNarrowScreen ? 12 : 14),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isNarrowScreen ? 12 : 14),
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
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    bool isSmallScreen = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF094B4A),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 12 : 15,
            horizontal: 15),
      ),
    );
  }
}