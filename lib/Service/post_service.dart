import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islamicinstapp/Model/post_model.dart';

class PostService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a new post
  Future<Post> createPost({
    required String communityName,
    required String title,
    required String content,
    String? imageUrl,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not authenticated');

    final postRef = _firestore.collection('posts').doc();
    final post = Post(
      id: postRef.id,
      userId: user.uid,
      userUuid: user.uid, // Or generate a UUID if needed
      communityName: communityName,
      title: title,
      content: content,
      imageUrl: imageUrl,
    );

    await postRef.set(post.toMap());
    return post;
  }

  // Get all posts
  Stream<List<Post>> getPosts() {
    return _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Post.fromMap(doc.data()))
        .toList());
  }

  // Update a post
  Future<void> updatePost({
    required String postId,
    String? title,
    String? content,
    String? imageUrl,
  }) async {
    await _firestore.collection('posts').doc(postId).update({
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'updatedAt': DateTime.now(),
    });
  }

  // Delete a post
  Future<void> deletePost(String postId) async {
    await _firestore.collection('posts').doc(postId).delete();
  }

  // Like a post
  Future<void> likePost(String postId, String userId) async {
    await _firestore.collection('posts').doc(postId).update({
      'likes': FieldValue.increment(1),
      'likedBy': FieldValue.arrayUnion([userId]),
    });
  }

  // Unlike a post
  Future<void> unlikePost(String postId, String userId) async {
    await _firestore.collection('posts').doc(postId).update({
      'likes': FieldValue.increment(-1),
      'likedBy': FieldValue.arrayRemove([userId]),
    });
  }
}