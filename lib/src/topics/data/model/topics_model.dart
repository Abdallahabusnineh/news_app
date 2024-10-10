import 'package:news_app/src/topics/domain/entites/topics_entites.dart';

class TopicsModel extends Topics{
  TopicsModel({required super.imageUri, required super.id, required super.description, required super.topic});


  factory TopicsModel.fromJson(Map<String, dynamic> json) {
    return TopicsModel(
      imageUri: json['image_uri'],
      id: json['id'],
      description: json['description'],
      topic: json['topic'],
    );
  }

}