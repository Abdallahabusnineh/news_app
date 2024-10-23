import 'package:news_app/src/post_screen/domain/entities/get_post_info_entites.dart';

class GetPostInfoModel extends GetPostInfoEntites {
  GetPostInfoModel(
      {required super.postId,
      required super.postImageUri,
      required super.title,
      required super.content,
      required super.createdAt,
      required super.commentCount,
      required super.likeCount,
      required super.isLiked,
      required super.isBookMarked,
      required super.topicId,
      required super.topicName,
      required super.topicDescription,
      required super.topicImageUri,
      required super.topicCreatedAt,
      required super.userId,
      required super.userName,
      required super.email,
      required super.type,
      required super.userImageUri
      });

  factory GetPostInfoModel.fromJson(Map<String, dynamic> json) {
    return GetPostInfoModel(
      //post info model

      postId: json['id']??0,
      postImageUri: json['image_uri']??'',
      title: json['title']??'',
      content: json['content']??'',
      createdAt: json['created_at']??'',
      commentCount: json['comments_count']??0,
      likeCount: json['likes_count']??0,
      isLiked: json['is_liked']??false,
      isBookMarked: json['is_bookmarked']??false,

      //topic info model

      topicId: json['topic']['id']??0,
      topicName: json['topic']['topic']??'',
      topicDescription: json['topic']['description']??'',
      topicImageUri: json['topic']['image_uri']??'',
      topicCreatedAt: json['topic']['created_at']??'',

      //user info model
      userId: json['user']['id']??0,
      userName: json['user']['user_name']??'',
      email: json['user']['email']??'',
      type: json['user']['type']??'',
      userImageUri: json['user']['profile']['image_uri']??'',
    );

  }
}
