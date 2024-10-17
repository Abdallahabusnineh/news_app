class YourFollowingEntities {
  final int followedId;
  final int userId;
  final String userName;
  final String email;
  bool isFollowed;

  YourFollowingEntities(
      {required this.followedId,
      required this.userId,
      required this.userName,
      required this.email,
      required this.isFollowed});
}
