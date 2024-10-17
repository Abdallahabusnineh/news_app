import 'package:news_app/src/new_sources/domain/entites/your_following_entites.dart';

class YourFollowingModels extends YourFollowingEntities {
  YourFollowingModels(
      {required super.followedId,
      required super.userId,
      required super.userName,
      required super.email,
      required super.isFollowed
      });

  factory YourFollowingModels.fromJson(Map<String, dynamic> json) {
    return YourFollowingModels(
      userId: json['user_id']??0,
      userName: json['followed']['user_name']??'',
      email: json['followed']['email']??'',
      followedId: json['followed']['id']??0,
      isFollowed: json['is_followed']??false,
    );
  }
}
