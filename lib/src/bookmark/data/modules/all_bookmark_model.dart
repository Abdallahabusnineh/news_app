import 'package:news_app/src/bookmark/domain/entities/add_fav_bookmark.dart';
import 'package:news_app/src/bookmark/domain/entities/all_bookmark.dart';

class AllBookmarkModel extends AllBookMark {
  AllBookmarkModel(
      {required super.userId,
      required super.createdAt,
      required super.userName,
      required super.email,
      required super.type,
      required super.followingCount,
      required super.followerCount,
      required super.newsCount,
      required super.imageUri,
      required super.postId,
      required super.postTitle,
      required super.postContent,
      required super.postCreatedAt});

  factory AllBookmarkModel.fromJson(Map<String, dynamic> json) {
    return AllBookmarkModel(
      userId: json['user_id'],
      createdAt: json['created_at'],
      userName: json['news']['user']['user_name'],
      email: json['news']['user']['email'],
      type: json['news']['user']['type'],
      followingCount: json['news']['user']['following_count'],
      followerCount: json['news']['user']['followers_count'],
      newsCount: json['news']['user']['news_count'],
      imageUri: json['news']['image_uri'],
      postId: json['new_id'],
      postTitle: json['news']['title'],
      postContent: json['news']['content'],
      postCreatedAt: json['news']['created_at'],
    );
  }
}
