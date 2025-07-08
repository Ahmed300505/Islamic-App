// edit_profile_provider.dart
import 'package:flutter/material.dart';

class EditProfileProvider with ChangeNotifier {
  String _name = 'John Doe';
  String _username = 'johndoe';
  String _bio = 'Muslim developer passionate about Islamic apps';
  String _profileImage = 'assets/images/profile_3.jpg';

  String get name => _name;
  String get username => _username;
  String get bio => _bio;
  String get profileImage => _profileImage;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  void updateBio(String newBio) {
    _bio = newBio;
    notifyListeners();
  }

  void updateProfileImage(String newImagePath) {
    _profileImage = newImagePath;
    notifyListeners();
  }

  void saveChanges(BuildContext context) {
    // Here you would typically save to backend/database
    Navigator.pop(context);
  }
}