class CreateNewPostEntites {
  final String topicId;
  final String title;
  final String content;
  final int userId;
  final String imageUri;
  final String createdAt;
  final int postId;

  CreateNewPostEntites(
      {required this.topicId,
      required this.title,
      required this.content,
      required this.userId,
      required this.imageUri,
      required this.createdAt,
      required this.postId});
}
