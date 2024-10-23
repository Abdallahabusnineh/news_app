class NewsByTopicIdEntites {
  final String title;
  final String content;
  final String userName;
  final String imageUri;
  final String createdAt;
  final int postId;
  final int topicId;
  final String topicName;
  final int userId;

  NewsByTopicIdEntites(
      {required this.title,
      required this.content,
      required this.userName,
      required this.imageUri,
      required this.createdAt,
      required this.postId,
      required this.topicId,
      required this.topicName,
      required this.userId});
}
