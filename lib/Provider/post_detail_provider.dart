// post_detail_provider.dart
import 'package:flutter/material.dart';

class PostDetailProvider with ChangeNotifier {
  final Map<String, dynamic> _communityData = {
    'image': 'assets/images/event.jpg',
    'name': 'GroundedTwinCities',
    'description': 'A community dedicated to Islamic learning and brotherhood in the Twin Cities area.',
    'website': 'https://groundedtwincities.com',
    'address': '123 Islamic Center, Minneapolis, MN 55401',
    'members': '2000',
    'following': '48',
    'leaders': [
      {'name': 'Brother Ahmed', 'role': 'Imam'},
      {'name': 'Sister Fatima', 'role': 'Organizer'},
      {'name': 'Brother Yusuf', 'role': 'Treasurer'},
      {'name': 'Sister Aisha', 'role': 'Event Coordinator'},
      {'name': 'Brother Ali', 'role': 'Volunteer'},
    ],
    'posts': [
      'assets/images/postimage1.jpg',
      'assets/images/postimage2.jpg',
      'assets/images/postimage3.jpg',
      'assets/images/postimage1.jpg',
      'assets/images/postimage2.jpg',
      'assets/images/postimage3.jpg',
    ],
    'programs': [
      'assets/images/postimage1.jpg',
      'assets/images/postimage2.jpg',
      'assets/images/postimage3.jpg',
      'assets/images/postimage1.jpg',
      'assets/images/postimage2.jpg',
      'assets/images/postimage3.jpg',
    ],
  };

  Map<String, dynamic> get communityData => _communityData;
}