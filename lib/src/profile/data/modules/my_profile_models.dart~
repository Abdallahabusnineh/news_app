import 'package:news_app/src/visit_profile_author/domain/entities/profile_author_entites.dart';

class ProfileAuthorModels extends ProfileAuthorEntites {
  ProfileAuthorModels(
      {required super.id,
      required super.userName,
      required super.email,
      required super.type,
      required super.followingCount,
      required super.followersCount,
      required super.newsCount,
      required super.fullName,
      required super.imageUri,
      required super.phoneNumber,
      required super.countryName,
      required super.countryId,
      required super.bio,
      required super.website});

  factory ProfileAuthorModels.fromJson(Map<String, dynamic> json) {
    return ProfileAuthorModels(
      id: json['id']??1,
      userName: json['user_name']??'',
      email: json['email']??'',
      type: json['type']??'',
      followingCount: json['following_count']??0,
      followersCount: json['followers_count']??0,
      newsCount: json['news_count']??0,
      //*******************************************************
      fullName: json['profile']['full_name']??'',
      imageUri: json['profile']['image_uri']??'',
      phoneNumber: json['profile']['phone_number']??'',
      countryName: json['profile']['country']['name']??'',
      countryId: json['profile']['country']['id']??1,
      bio: json['profile']['bio']??'',
      website: json['profile']['website']??'',
    );
  }
}
