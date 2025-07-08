// add_post_provider.dart
import 'package:flutter/material.dart';

class AddPostProvider with ChangeNotifier {
  String? _selectedCommunity;
  final TextEditingController _postController = TextEditingController();
  final List<Map<String, dynamic>> communities = [
    {
      'name': 'General Discussion',
      'image': 'assets/images/islamicevent.jpg',
    },
    {
      'name': 'Quran Study Group',
      'image': 'assets/images/islamicevent2.jpg',
    },
    {
      'name': 'Islamic Questions',
      'image': 'assets/images/postimage1.jpg',
    },
    {
      'name': 'Sisters Forum',
      'image': 'assets/images/postimage2.jpg',
    },
    {
      'name': 'New Muslims',
      'image': 'assets/images/postimage3.jpg',
    },
    {
      'name': 'Islamic Finance',
      'image': 'assets/images/profile_1.jpg',
    }
  ];

  String? get selectedCommunity => _selectedCommunity;
  TextEditingController get postController => _postController;

  void selectCommunity(String? community) {
    _selectedCommunity = community;
    notifyListeners();
  }

  void submitPost(BuildContext context) {
    // Here you would typically save the post to backend/database
    if (_selectedCommunity == null || _postController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a community and write a post')),
      );
      return;
    }

    // Clear fields after submission
    _postController.clear();
    _selectedCommunity = null;
    notifyListeners();

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }
}