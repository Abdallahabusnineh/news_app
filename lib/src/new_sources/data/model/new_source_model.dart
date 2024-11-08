import 'package:news_app/src/new_sources/domain/entites/new_source_entites.dart';

class NewSourceModel extends NewSource {
  NewSourceModel(
      {required super.userName,
      required super.id,
      required super.email,
      required super.type,
      required super.followingCount,
      required super.followersCount,
      required super.newsCount,
      required super.isFollowed});

  factory NewSourceModel.fromJson(Map<String, dynamic> json) {
    return NewSourceModel(
      userName: json['user_name'],
      id: json['id'],
      email: json['email'],
      type: json['type'],
      followingCount: json['following_count'],
      followersCount: json['followers_count'],
      newsCount: json['news_count'],
      isFollowed: json['is_followed'] ?? false,
    );
  }
}
