import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islamicinstapp/Model/userModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> registerWithEmailAndPassword({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      UserModel user = UserModel(
        id: uid,
        name: name,
        username: username,
        email: email,
        role: 'user', // default role
        createdAt: DateTime.now(),
      );

      // Save user data in Firestore using UID as document ID
      await _firestore.collection('users').doc(uid).set(user.toJson());

      return user;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }
}
