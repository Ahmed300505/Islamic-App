import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/post_detail_page.dart';

class PostCard extends StatelessWidget {
  final String postId;
  final String communityName;
  final String postText;
  final String imageUrl;
  final int likes;
  final int comments;
  final bool isLiked;
  final bool isSaved;
  final VoidCallback onLikePressed;
  final VoidCallback onSavePressed;
  final VoidCallback onCommentPressed;

  const PostCard({
    super.key,
    required this.postId,
    required this.communityName,
    required this.postText,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.isLiked,
    required this.isSaved,
    required this.onLikePressed,
    required this.onSavePressed,
    required this.onCommentPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(postId: postId),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Post header with logo and plus icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF033941).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(Icons.groups, color: Color(0xFF033941)),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      communityName,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF033941)),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.add, size: 32),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Main post image
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                imageUrl, // Make sure this is the correct path from assets
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                // Asset images don't support loadingBuilder, so remove that
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // Post actions (like, share, comment, save)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        size: 28,
                        color: isLiked ? Colors.red : const Color(0xFF033941),
                      ),
                      onPressed: onLikePressed,
                    ),
                    IconButton(
                      icon: const Icon(Icons.share_outlined, size: 28, color: Color(0xFF033941)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.comment_outlined, size: 28, color: Color(0xFF033941)),
                      onPressed: onCommentPressed,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    size: 28,
                    color: const Color(0xFF033941),
                  ),
                  onPressed: onSavePressed,
                ),
              ],
            ),
            const SizedBox(height: 6),
            // Post text and stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$likes likes',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$communityName: ',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        TextSpan(
                          text: postText,
                          style: const TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'View all $comments comments',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
