class NewSource {
  final String userName;
  final int id;
  bool isFollowed;
  final String email;
  final String type;
  final int followingCount;
  final int followersCount;
  final int newsCount;

  NewSource(
      {required this.userName,
      required this.id,
      required this.email,
      required this.type,
      required this.followingCount,
      required this.followersCount,
      required this.newsCount,
      required this.isFollowed});
}
