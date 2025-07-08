// home_provider.dart
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String _selectedCommunity = 'My Communities';
  final List<String> _communities = [
    'My Communities',
    'GroundedTwinCities',
    'Islamic Study Group',
    'Quran Recitation'
  ];

  final List<Map<String, dynamic>> _posts = [
    {
      'id': '1',
      'communityName': 'GroundedTwinCities',
      'postText': 'Alhamdulillah we are pleased to invite you all to our eighth session of our Seerah Series...',
      'imageUrl': 'assets/images/postimage1.jpg',
      'likes': 24,
      'comments': 5,
      'isLiked': false,
      'isSaved': false,
    },
    {
      'id': '2',
      'communityName': 'Islamic Study Group',
      'postText': 'Join us this Friday for a special lecture on the life of Prophet Muhammad (PBUH)...',
      'imageUrl': 'assets/images/postimage2.jpg',
      'likes': 42,
      'comments': 12,
      'isLiked': true,
      'isSaved': true,
    },
    {
      'id': '3',
      'communityName': 'Quran Recitation',
      'postText': 'Weekly Quran recitation circle starts tomorrow at 7 PM. Bring your mus-hafs...',
      'imageUrl': 'assets/images/postimage3.jpg',
      'likes': 15,
      'comments': 3,
      'isLiked': false,
      'isSaved': false,
    },
  ];

  String get selectedCommunity => _selectedCommunity;
  List<String> get communities => _communities;
  List<Map<String, dynamic>> get posts => _posts;

  void changeCommunity(String newValue) {
    _selectedCommunity = newValue;
    notifyListeners();
  }

  void toggleLike(int index) {
    _posts[index]['isLiked'] = !_posts[index]['isLiked'];
    _posts[index]['likes'] = _posts[index]['isLiked']
        ? _posts[index]['likes'] + 1
        : _posts[index]['likes'] - 1;
    notifyListeners();
  }

  void toggleSave(int index) {
    _posts[index]['isSaved'] = !_posts[index]['isSaved'];
    notifyListeners();
  }
}