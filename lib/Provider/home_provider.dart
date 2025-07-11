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
