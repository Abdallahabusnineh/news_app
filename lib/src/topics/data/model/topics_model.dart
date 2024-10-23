import 'package:news_app/src/topics/domain/entites/topics_entites.dart';

class TopicsModel extends TopicsEntites {
  TopicsModel(
      {required super.imageUri,
      required super.id,
      required super.description,
      required super.topic,
      required super.isSaved});

  factory TopicsModel.fromJson(Map<String, dynamic> json) {
    return TopicsModel(
      imageUri: json['image_uri'],
      id: json['id'],
      description: json['description'],
      topic: json['topic'],
      isSaved: json['isSaved'] ?? false,
    );
  }
}

class TopicCategoryModel extends TopicsCategoryEntites {
  TopicCategoryModel({required super.id, required super.topic});

  factory TopicCategoryModel.fromJson(Map<String, dynamic> json) {
    return TopicCategoryModel(
      id: json['id'],
      topic: json['topic'],
    );
  }
  }
