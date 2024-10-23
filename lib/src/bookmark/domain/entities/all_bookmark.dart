class AllBookMark {
  //**************** author entities ****************
  final int userId;
  final String createdAt;
  final String userName;
  final String email;
  final String type;
  final int followingCount;
  final int followerCount;
  final int newsCount;
  final String imageUri;

  //**************** post entities ****************

  final int postId;
  final String postTitle;
  final String postContent;
  final String postCreatedAt;

  AllBookMark(
      {required this.userId,
      required this.createdAt,
      required this.userName,
      required this.email,
      required this.type,
      required this.followingCount,
      required this.followerCount,
      required this.newsCount,
      required this.imageUri,
      required this.postId,
      required this.postTitle,
      required this.postContent,
      required this.postCreatedAt});
}
