import 'package:news_app/src/fill_profile/domain/entites/fill_your_profile_entites.dart';

class CreateProfileModel extends CreateProfile {
  CreateProfileModel(
      {required super.userId,
      required super.imageUri,
      required super.fullName,
      required super.phoneNumber,
      required super.countryName,
      required super.countryId,
      required super.bio,
      required super.website});

  factory CreateProfileModel.fromJson(Map<String, dynamic> json) {
    return CreateProfileModel(
      userId: json['user_id']??0,
      imageUri: json['image_uri']??'',
      fullName: json['full_name']??'',
      phoneNumber: json['phone_number']??'',
      countryName: json['country']['country_name']??'',
      countryId: json['country']['country_id']??0,
      bio: json['bio']??'',
      website: json['website']??'',
    );
  }
}
