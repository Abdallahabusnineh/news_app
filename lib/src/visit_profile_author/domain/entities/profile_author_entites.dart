class ProfileAuthorEntites {
  final int id;
  final String userName;
  final String email;
  final String type;
  final int followingCount;
  final int followersCount;
  final int newsCount;

  //***************************
  final String fullName;
  final String imageUri;
  final String phoneNumber;
  final String countryName;
  final int countryId;
  final String bio;
  final String website;

  ProfileAuthorEntites(
      {required this.id,
      required this.userName,
      required this.email,
      required this.type,
      required this.followingCount,
      required this.followersCount,
      required this.newsCount,
      required this.fullName,
      required this.imageUri,
      required this.phoneNumber,
      required this.countryName,
      required this.countryId,
      required this.bio,
      required this.website});
}
