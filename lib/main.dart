import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:islamicinstapp/Provider/add_post_provider.dart';
import 'package:islamicinstapp/Provider/auth_selection_provider.dart';
import 'package:islamicinstapp/Provider/calendar_provider.dart';
import 'package:islamicinstapp/Provider/edit_profile_provider.dart';
import 'package:islamicinstapp/Provider/forum_provider.dart';
import 'package:islamicinstapp/Provider/messaging_provider.dart';
import 'package:islamicinstapp/Provider/new_chat_provider.dart';
import 'package:islamicinstapp/Provider/notification_provider.dart';
import 'package:islamicinstapp/Provider/profile_provider.dart';
import 'package:islamicinstapp/Provider/register_provider.dart';
import 'package:islamicinstapp/Provider/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:islamicinstapp/SplashScreens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AuthSelectionProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => NewChatProvider()),
        ChangeNotifierProvider(create: (_) => MessagingProvider()),
        ChangeNotifierProvider(create: (_) => ForumProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => EditProfileProvider()),
        ChangeNotifierProvider(create: (_) => AddPostProvider()),
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
