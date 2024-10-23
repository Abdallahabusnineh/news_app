import 'package:news_app/src/home/presentation/widget/tab_bar_view/domain/entites/news_by_topic_id_entites.dart';

class NewsByTopicIdModel extends NewsByTopicIdEntites {
  NewsByTopicIdModel(
      {required super.title,
      required super.content,
      required super.userName,
      required super.imageUri,
      required super.createdAt,
      required super.postId,
      required super.topicId,
      required super.topicName,
      required super.userId});


  factory NewsByTopicIdModel.fromJson(Map<String, dynamic> json) {
    return NewsByTopicIdModel(
      title: json['title']??'',
      content: json['content']??'',
      userName: json['user']['user_name']??'',
      userId: json['user']['id']??0,
      imageUri: json['image_uri']??'',
      createdAt: json['created_at']??'',
      postId: json['id']??0,
      topicId: json['topic_id']??0,
      topicName: json['topic']['topic_name']??'',
    );
  }
}
