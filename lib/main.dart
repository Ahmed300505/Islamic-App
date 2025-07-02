import 'package:flutter/material.dart';
import 'package:islamicinstapp/AuthScreens/register.dart';
import 'package:islamicinstapp/SplashScreens/splashscreen.dart';
import 'package:islamicinstapp/screens/umrahLinks.dart';
import 'package:islamicinstapp/screens/user_profile.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFEFDEB),
        primaryColor: const Color(0xFF033941),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF033941),
          secondary: Color(0xFF033941),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFEFDEB),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF033941)),
        ),
      ),
      home: const UmrahLinks(),
    );
  }
}