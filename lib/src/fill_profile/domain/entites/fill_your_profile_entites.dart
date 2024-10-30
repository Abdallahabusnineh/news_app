class CreateProfile {
  final int userId;
  final String imageUri;
  final String fullName;
  final String phoneNumber;
  final String countryName;
  final int countryId;
  final String bio;
  final String website;

  CreateProfile(
      {required this.userId,
      required this.imageUri,
      required this.fullName,
      required this.phoneNumber,
      required this.countryName,
      required this.countryId,
      required this.bio,
      required this.website});
}
