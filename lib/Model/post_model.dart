class Post {
  final String id;
  final String userId;
  final String userUuid;
  final String communityName;
  final String title;
  final String content;
  final String? imageUrl;
  final int likes;
  final int comments;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Post({
    required this.id,
    required this.userId,
    required this.userUuid,
    required this.communityName,
    required this.title,
    required this.content,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      userUuid: map['userUuid'] ?? '',
      communityName: map['communityName'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'],
      likes: map['likes'] ?? 0,
      comments: map['comments'] ?? 0,
      createdAt: map['createdAt']?.toDate() ?? DateTime.now(),
      updatedAt: map['updatedAt']?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userUuid': userUuid,
      'communityName': communityName,
      'title': title,
      'content': content,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}