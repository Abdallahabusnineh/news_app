import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/topics/data/model/topics_by_search_model.dart';
import 'package:news_app/src/topics/data/model/topics_model.dart';
import 'package:news_app/src/topics/data/repositories/topics_repository.dart';
import '../../data/datasource/topics_data_source.dart';

final topicsNotifierProvider = ChangeNotifierProvider((ref) {
  return TopicsNotifier();
});
class TopicsNotifier extends ChangeNotifier {
  TopicsNotifier(){
   getTopics();
  }

  
  TopicsRepository topicsRepository =
      TopicsRepository(baseTopicsDataSource: TopicsDataSource());
  List<TopicsModel> topics = [];
  static List<int> selectedTopics = [];
  List<TopicsBySearchModel> topicsOfSearch = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }
  bool _isError = false;

  bool get isError => _isError; 

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  Future<void> getTopics() async {
   isLoading = true;
    try {
      final result = await topicsRepository.getTopics();
      result.fold((l) {
        isError = true;
      }, (r) {
        topics = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;  
    }
    isLoading = false;
  }
  Future<void> getTopicsBySearch(String text) async {
   isLoading = true;
    try {
      final result = await topicsRepository.getTopicsBySearch(text);
      result.fold((l) {
        isError = true;
      }, (r) {
        topicsOfSearch = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }
void searchTopic(String text) {
  getTopicsBySearch(text);
  topics = topics.where((element) => element.topic.contains(text)).toList();
  notifyListeners();
}
  void toggleTopic(int index) {
    topics[index].isSaved = !topics[index].isSaved;
    if (topics[index].isSaved && !selectedTopics.contains(index)) {
      selectedTopics.add(index);
    } else if (!topics[index].isSaved) {
      selectedTopics.remove(index);
    }
    notifyListeners();
  }
}
