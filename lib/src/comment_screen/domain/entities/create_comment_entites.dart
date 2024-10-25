class CreateCommentEntites {
  final int commentId;
  final int userId;
  final String newsId;
  final String commentContent;
  final String createdAt;
  final String userName;
  final String userImageUri;

  CreateCommentEntites(
      {required this.commentId,
      required this.userId,
      required this.newsId,
      required this.commentContent,
      required this.createdAt,
      required this.userName,
      required this.userImageUri});
}
