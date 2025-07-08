// main.dart
import 'package:flutter/material.dart';
import 'package:islamicinstapp/Provider/add_post_provider.dart';
import 'package:islamicinstapp/Provider/auth_selection_provider.dart';
import 'package:islamicinstapp/Provider/calendar_provider.dart';
import 'package:islamicinstapp/Provider/edit_profile_provider.dart';
import 'package:islamicinstapp/Provider/event_detail_provider.dart';
import 'package:islamicinstapp/Provider/forum_provider.dart';
import 'package:islamicinstapp/Provider/messaging_provider.dart';
import 'package:islamicinstapp/Provider/new_chat_provider.dart';
import 'package:islamicinstapp/Provider/notification_provider.dart';
import 'package:islamicinstapp/Provider/profile_provider.dart';
import 'package:islamicinstapp/Provider/splash_provider.dart';
import 'package:islamicinstapp/SplashScreens/splashscreen.dart';
import 'package:islamicinstapp/screens/Forum.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AuthSelectionProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider( create: (_) => NewChatProvider()),
        ChangeNotifierProvider(create: (_) => MessagingProvider()),
        ChangeNotifierProvider(create: (_) => ForumProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()), // Add this
        ChangeNotifierProvider(create: (_) => EditProfileProvider()), // Add this
        ChangeNotifierProvider(create: (_) => AddPostProvider()), // Add this
        ChangeNotifierProvider(create: (_) => CalendarProvider()), // Add this
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}