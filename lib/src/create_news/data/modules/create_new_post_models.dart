import 'package:news_app/src/create_news/domain/entities/create_new_post_entites.dart';

class CreateNewPostModels extends CreateNewPostEntites {
  CreateNewPostModels(
      {required super.topicId,
      required super.title,
      required super.content,
      required super.userId,
      required super.imageUri,
      required super.createdAt,
      required super.postId});


  factory CreateNewPostModels.fromJson(Map<String, dynamic> json) {
    return CreateNewPostModels(
      topicId: json['topic_id'],
      title: json['title'],
      content: json['content'],
      userId: json['user_id'],
      imageUri: json['image_uri'],
      createdAt: json['created_at'],
      postId: json['id'],
    );
  }
}
