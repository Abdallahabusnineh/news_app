class GetPostInfoEntites {
//post info entities

  final int postId;
  final String postImageUri;
  final String title;
  final String content;
  final String createdAt;
  final int commentCount;
  final int likeCount;
  final bool isLiked;
  final bool isBookMarked;

  //topic info entities
  final int topicId;
  final String topicName;
  final String topicDescription;
  final String topicImageUri;
  final String topicCreatedAt;

  //user info entities
  final int userId;
  final String userName;
  final String email;
  final String type;
  final String userImageUri;

  GetPostInfoEntites(
      {required this.postId,
      required this.postImageUri,
      required this.title,
      required this.content,
      required this.createdAt,
      required this.commentCount,
      required this.likeCount,
      required this.isLiked,
      required this.isBookMarked,
      required this.topicId,
      required this.topicName,
      required this.topicDescription,
      required this.topicImageUri,
      required this.topicCreatedAt,
      required this.userId,
      required this.userName,
      required this.email,
      required this.type,
      required this.userImageUri});
}
