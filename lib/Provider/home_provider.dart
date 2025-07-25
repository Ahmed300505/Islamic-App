// home_provider.dart
import 'package:flutter/material.dart';
import 'package:islamicinstapp/Service/post_service.dart';
import 'package:islamicinstapp/Model/post_model.dart';

class HomeProvider extends ChangeNotifier {
  final List<String> communities = [
    'All',
    'General Discussion',
    'Quran Study Group',
    'Islamic Questions',
    'Sisters Forum',
    'New Muslims',
    'Islamic Finance',
  ];

  String selectedCommunity = 'All';
  List<Post> _posts = [];
  final List<Map<String, dynamic>> _posts = [
    {
      'id': '1',
      'communityName': 'GroundedTwinCities',
      'postText': 'Alhamdulillah we are pleased to invite you all to our eighth session of our Seerah Series...',
      'imageUrl': 'assets/images/homepagepost1.png',
      'likes': 24,
      'comments': 5,
      'isLiked': false,
      'isSaved': false,
    },
    {
      'id': '2',
      'communityName': 'Islamic Study Group',
      'postText': 'Join us this Friday for a special lecture on the life of Prophet Muhammad (PBUH)...',
      'imageUrl': 'assets/images/homepagepost2.png',
      'likes': 42,
      'comments': 12,
      'isLiked': true,
      'isSaved': true,
    },
    {
      'id': '3',
      'communityName': 'Quran Recitation',
      'postText': 'Weekly Quran recitation circle starts tomorrow at 7 PM. Bring your mus-hafs...',
      'imageUrl': 'assets/images/homepagepost3.png',
      'likes': 15,
      'comments': 3,
      'isLiked': false,
      'isSaved': false,
    },
  ];

  List<Post> get posts {
    if (selectedCommunity == 'All') return _posts;
    return _posts.where((post) => post.communityName == selectedCommunity).toList();
  }

  void changeCommunity(String value) {
    selectedCommunity = value;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    PostService().getPosts().listen((data) {
      _posts = data;
      notifyListeners();
    });
  }
}
