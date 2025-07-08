import 'package:flutter/material.dart';
import 'package:islamicinstapp/Provider/login_provider.dart';
import 'package:islamicinstapp/Styles/colors.dart';
import 'package:islamicinstapp/Styles/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/AuthScreens/register.dart';
import 'package:islamicinstapp/screens/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isVerySmallScreen = screenSize.height < 600;
    final isNarrowScreen = screenSize.width < 350;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login Form Container
                Container(
                  width: screenSize.width * 0.9,
                  constraints: const BoxConstraints(maxWidth: 500),
                  margin: EdgeInsets.symmetric(
                    horizontal: isNarrowScreen ? 10 : 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5DC),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Logo
                      _buildLogo(context, isVerySmallScreen),

                      // Title and Sign Up link
                      _buildHeader(context, isVerySmallScreen, isNarrowScreen),

                      // Form Fields
                      _buildFormFields(context, isVerySmallScreen, isNarrowScreen),

                      // Forget Password
                      _buildForgotPassword(context, isVerySmallScreen, isNarrowScreen),

                      // Login Button
                      _buildLoginButton(context, isVerySmallScreen, isNarrowScreen),
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

  Widget _buildLogo(BuildContext context, bool isVerySmallScreen) {
    return Transform.translate(
      offset: Offset(0, isVerySmallScreen ? -25 : -40),
      child: Container(
        width: isVerySmallScreen ? 100 : 140,
        height: isVerySmallScreen ? 100 : 140,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(70),
          image: const DecorationImage(
            image: AssetImage('assets/images/islamiclogo.png'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isVerySmallScreen, bool isNarrowScreen) {
    return Padding(
      padding: EdgeInsets.only(
        top: isVerySmallScreen ? 5 : 15,
        bottom: isVerySmallScreen ? 10 : 20,
      ),
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyles.loginTitleText(context),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyles.loginFooterText(context),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyles.loginFooterText(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(BuildContext context, bool isVerySmallScreen, bool isNarrowScreen) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isNarrowScreen ? 15 : 20,
      ),
      child: Column(
        children: [
          _buildTextField(
            context: context,
            controller: loginProvider.emailController,
            hintText: 'Email Address',
            icon: Icons.email_outlined,
            isSmallScreen: isVerySmallScreen,
          ),
          SizedBox(height: isVerySmallScreen ? 8 : 12),
          _buildPasswordField(
            context: context,
            controller: loginProvider.passwordController,
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
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
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
  }) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return TextField(
      controller: controller,
      obscureText: loginProvider.obscurePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.primary,
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            loginProvider.obscurePassword
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.white70,
          ),
          onPressed: () => loginProvider.togglePasswordVisibility(),
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

  Widget _buildForgotPassword(BuildContext context, bool isVerySmallScreen, bool isNarrowScreen) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          right: isNarrowScreen ? 15 : 20,
          top: isVerySmallScreen ? 5 : 10,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyles.forgotPasswordText(context),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, bool isVerySmallScreen, bool isNarrowScreen) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Padding(
      padding: EdgeInsets.all(isVerySmallScreen ? 12 : 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: isVerySmallScreen ? 12 : 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
          onPressed: loginProvider.isLoading
              ? null
              : () => loginProvider.login(context),
          child: loginProvider.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
            'Login',
            style: TextStyles.loginButtonText(context),
          ),
        ),
      ),
    );
  }
}