import 'package:flutter/material.dart';
import 'package:islamicinstapp/Provider/register_provider.dart';
import 'package:islamicinstapp/Styles/colors.dart';
import 'package:islamicinstapp/Styles/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/AuthScreens/login.dart';
import 'package:islamicinstapp/screens/home_page.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: const _RegisterScreenContent(),
    );
  }
}

class _RegisterScreenContent extends StatelessWidget {
  const _RegisterScreenContent();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isVerySmallScreen = screenSize.height < 600;
    final isSmallScreen = screenSize.height < 700;
    final isNarrowScreen = screenSize.width < 350;
    final isWideScreen = screenSize.width > 400;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: isVerySmallScreen ? 10 : 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Register Form Container
                Container(
                  width: isWideScreen ? screenSize.width * 0.85 : screenSize.width * 0.9,
                  constraints: const BoxConstraints(maxWidth: 500),
                  margin: EdgeInsets.symmetric(horizontal: isNarrowScreen ? 10 : 20),
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
                      _buildLogo(context, isVerySmallScreen, isSmallScreen),

                      // Title and Sign In link
                      _buildHeader(context, isVerySmallScreen, isSmallScreen, isNarrowScreen),

                      // Form Fields
                      _buildFormFields(context, isVerySmallScreen, isSmallScreen, isNarrowScreen),

                      // Register Button
                      _buildRegisterButton(context, isVerySmallScreen, isSmallScreen, isNarrowScreen),
                    ],
                  ),
                ),

                // Terms and Privacy text
                _buildTermsAndPrivacy(context, isVerySmallScreen, isSmallScreen, isNarrowScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context, bool isVerySmallScreen, bool isSmallScreen) {
    return Transform.translate(
      offset: Offset(0, isVerySmallScreen ? -25 : -40),
      child: Container(
        width: isVerySmallScreen ? 90 : isSmallScreen ? 120 : 140,
        height: isVerySmallScreen ? 90 : isSmallScreen ? 120 : 140,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(70),
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1564121211835-e88c852648ab'),
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
    );
  }

  Widget _buildHeader(BuildContext context, bool isVerySmallScreen, bool isSmallScreen, bool isNarrowScreen) {
    return Padding(
      padding: EdgeInsets.only(
          top: isVerySmallScreen ? 0 : isSmallScreen ? 10 : 15,
          bottom: isVerySmallScreen ? 8 : isSmallScreen ? 12 : 20),
      child: Column(
        children: [
          Text(
            'Create Account',
            style: TextStyles.registerTitleText(context),
          ),
          SizedBox(height: isVerySmallScreen ? 5 : 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyles.registerFooterText(context),
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
                  style: TextStyles.registerFooterText(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(BuildContext context, bool isVerySmallScreen, bool isSmallScreen, bool isNarrowScreen) {
    final registerProvider = Provider.of<RegisterProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isNarrowScreen ? 12 : isSmallScreen ? 18 : 20),
      child: Column(
        children: [
          _buildTextField(
            context: context,
            controller: registerProvider.nameController,
            hintText: 'Name',
            icon: Icons.person,
            isSmallScreen: isVerySmallScreen,
          ),
          SizedBox(height: isVerySmallScreen ? 6 : isSmallScreen ? 10 : 12),
          _buildTextField(
            context: context,
            controller: registerProvider.usernameController,
            hintText: 'Username',
            icon: Icons.person_outline,
            isSmallScreen: isVerySmallScreen,
          ),
          SizedBox(height: isVerySmallScreen ? 6 : isSmallScreen ? 10 : 12),
          _buildTextField(
            context: context,
            controller: registerProvider.emailController,
            hintText: 'Email Address',
            icon: Icons.email_outlined,
            isSmallScreen: isVerySmallScreen,
          ),
          SizedBox(height: isVerySmallScreen ? 6 : isSmallScreen ? 10 : 12),
          _buildPasswordField(
            context: context,
            controller: registerProvider.passwordController,
            isSmallScreen: isVerySmallScreen,
            isPassword: true,
          ),
          SizedBox(height: isVerySmallScreen ? 6 : isSmallScreen ? 10 : 12),
          _buildConfirmPasswordField(
            context: context,
            controller: registerProvider.confirmPasswordController,
            isSmallScreen: isVerySmallScreen,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isSmallScreen = false,
  }) {
    final isNarrowScreen = MediaQuery.of(context).size.width < 350;

    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white, size: isNarrowScreen ? 20 : 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 12 : 15,
          horizontal: 15,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required BuildContext context,
    required TextEditingController controller,
    bool isSmallScreen = false,
    bool isPassword = false,
  }) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final isNarrowScreen = MediaQuery.of(context).size.width < 350;

    return TextField(
      controller: controller,
      obscureText: registerProvider.obscurePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.white, size: isNarrowScreen ? 20 : 22),
        suffixIcon: IconButton(
          icon: Icon(
            registerProvider.obscurePassword
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.white70,
          ),
          onPressed: () => registerProvider.togglePasswordVisibility(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 12 : 15,
          horizontal: 15,
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField({
    required BuildContext context,
    required TextEditingController controller,
    bool isSmallScreen = false,
  }) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final isNarrowScreen = MediaQuery.of(context).size.width < 350;

    return TextField(
      controller: controller,
      obscureText: registerProvider.obscureConfirmPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        hintText: 'Confirm Password',
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.white, size: isNarrowScreen ? 20 : 22),
        suffixIcon: IconButton(
          icon: Icon(
            registerProvider.obscureConfirmPassword
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.white70,
          ),
          onPressed: () => registerProvider.toggleConfirmPasswordVisibility(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: isSmallScreen ? 12 : 15,
          horizontal: 15,
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context, bool isVerySmallScreen, bool isSmallScreen, bool isNarrowScreen) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    return Padding(
      padding: EdgeInsets.all(isVerySmallScreen ? 10 : isSmallScreen ? 15 : 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: isVerySmallScreen ? 10 : isSmallScreen ? 14 : 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
          onPressed: registerProvider.isLoading
              ? null
              : () => registerProvider.register(context),
          child: registerProvider.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
            'Register',
            style: TextStyles.registerButtonText(context),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndPrivacy(BuildContext context, bool isVerySmallScreen, bool isSmallScreen, bool isNarrowScreen) {
    return Padding(
      padding: EdgeInsets.only(
          top: isVerySmallScreen ? 12 : isSmallScreen ? 16 : 20,
          left: 20,
          right: 20,
          bottom: isVerySmallScreen ? 10 : 15),
      child: Column(
        children: [
          Text(
            'By Creating an account you agree to our',
            style: TextStyles.termsText(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isVerySmallScreen ? 3 : 4),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Terms Of Service',
                  style: TextStyles.termsText(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'and',
                style: TextStyles.termsText(context),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Privacy Policy',
                  style: TextStyles.termsText(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}