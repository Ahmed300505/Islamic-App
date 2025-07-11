// profile_provider.dart
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final Map<String, dynamic> _profileData = {
    'name': 'User',
    'username': '@User300505',
    'bio': 'Share your favourite quran verse',
    'followers': '2000k',
    'following': '36',
    'coverPhoto': 'assets/images/profileimage.png',
    'profileImage': 'assets/images/profilelogo.png',
    'communities': [
      {
        'name': 'Brother Ahmed',
        'role': 'Imam',
        'initials': 'BA'
      },
      {
        'name': 'Sister Fatima',
        'role': 'Organizer',
        'initials': 'SF'
      },
      {
        'name': 'Brother Yusuf',
        'role': 'Treasurer',
        'initials': 'BY'
      },
      {
        'name': 'Sister Aisha',
        'role': 'Event Coordinator',
        'initials': 'SA'
      },
      {
        'name': 'Brother Ali',
        'role': 'Volunteer',
        'initials': 'BA'
      },
    ],
    'awliya': [
      {
        'name': 'Sheikh Abdullah',
        'role': 'Scholar',
        'initials': 'SA'
      },
      {
        'name': 'Imam Muhammad',
        'role': 'Imam',
        'initials': 'IM'
      },
      {
        'name': 'Ustadh Ibrahim',
        'role': 'Teacher',
        'initials': 'UI'
      },
    ],
  };

  Map<String, dynamic> get profileData => _profileData;

  void updateProfile(Map<String, dynamic> newData) {
    _profileData.addAll(newData);
    notifyListeners();
  }
}