class TopicsEntites {
final String imageUri;
final int id;
final String description;
final String topic;
  bool isSaved;

TopicsEntites({required this.imageUri, required this.id, required this.description, required this.topic, required this.isSaved});

  }


  class TopicsCategoryEntites {
  final int id;
  final String topic;

  TopicsCategoryEntites({required this.id, required this.topic});

}