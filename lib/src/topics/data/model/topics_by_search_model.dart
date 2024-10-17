import 'package:news_app/src/topics/domain/entites/topics_by_search_entites.dart';
import 'package:news_app/src/topics/domain/entites/topics_entites.dart';



class TopicsBySearchModel extends TopicsBySearchEntites{
  TopicsBySearchModel({required super.imageUri, required super.id, required super.description, required super.topic});


  factory TopicsBySearchModel.fromJson(Map<String, dynamic> json) {
    return TopicsBySearchModel(
      imageUri: json['image_uri'],
      id: json['id'],
      description: json['description'],
      topic: json['topic'],
    );
  }

}