/*
import 'package:news_app/src/bookmark/domain/entities/add_fav_bookmark.dart';

class AddFavBookmarkModel extends AddFavBookmark {
  AddFavBookmarkModel(
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

  factory AddFavBookmarkModel.fromJson(Map<String, dynamic> json) {
    return AddFavBookmarkModel(
      userId: json['user_id'],
      createdAt: json['created_at'],
      userName: json['user']['user_name'],
      email: json['user']['email'],
      type: json['user']['type'],
      followingCount: json['user']['following_count'],
      followerCount: json['user']['followers_count'],
      newsCount: json['user']['news_count'],
      imageUri: json['news']['image_uri'],
      postId: json['new_id'],
      postTitle: json['news']['title'],
      postContent: json['news']['content'],
      postCreatedAt: json['news']['created_at'],
    );
  }
}
*/
