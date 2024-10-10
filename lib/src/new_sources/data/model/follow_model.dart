import 'package:news_app/src/new_sources/domain/entites/follow_entites.dart';

class FollowModel extends FollowEntities{
  FollowModel({required super.userId, required super.followingId});

  factory FollowModel.fromJson(Map<String, dynamic> json) {
    return FollowModel(
        userId: json['user_id'],
        followingId: json['following_id']
    );
  }
}