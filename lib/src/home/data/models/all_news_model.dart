import 'package:news_app/src/home/domain/entites/all_news_entites.dart';

class AllNewsModel extends AllNewsEntities {
  AllNewsModel(
      {required super.postId,
      required super.topicId,
      required super.postImageUri,
      required super.title,
      required super.content,
      required super.createdAt,
      required super.userId,
      required super.userName,
      required super.email,
      required super.type,
      required super.userImageUri});

  factory AllNewsModel.fromJson(Map<String, dynamic> json) {
    return AllNewsModel(
      // ************ post model**************
      postId: json['id'],
      topicId: json['topic_id'],
      postImageUri: json['image_uri'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      // ************ user model**************
      userId: json['user']['id'],
      userName: json['user']['user_name'],
      email: json['user']['email'],
      type: json['user']['type'],
      userImageUri: json['user']['profile']['image_uri'],
    );
  }

}


