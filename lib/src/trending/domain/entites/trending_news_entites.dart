class TrendingNewsEntities {
  // *******************post model**********************

  final int postId;
  final int topicId;
  final String postImageUri;
  final String title;
  final String content;
  final String createdAt;
  // *******************user model**********************
final int userId;
final String userName;
final String email;
final String type;
final String userImageUri;

  TrendingNewsEntities({required this.postId, required this.topicId, required this.postImageUri, required this.title, required this.content, required this.createdAt, required this.userId, required this.userName, required this.email, required this.type, required this.userImageUri});

  }