import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/data/datasource/news_by_topic_id_datasource.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/data/models/news_by_topic_id_model.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/data/repository/news_by_topic_id_repository.dart';

final newsByTopicIdProvider =
    ChangeNotifierProvider<NewsByTopicIdChangeNotifier>(
        (ref) => NewsByTopicIdChangeNotifier());

class NewsByTopicIdChangeNotifier extends ChangeNotifier {
  NewsByTopicIdChangeNotifier() {
    getNewsByTopicId(1);
  }
    int ?topicId;
  NewsByTopicIdRepository newsByTopicIdRepository = NewsByTopicIdRepository(
      newsByTopicIdBaseDataSource: NewsByTopicIdDatasource());
  List<NewsByTopicIdModel> newsByTopicId = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isError = false;

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  Future<void> getNewsByTopicId(int topicId) async {
    isLoading = true;
    try {
      final result = await newsByTopicIdRepository.getNewsByTopicId(topicId);
      result.fold((l) {
        isError = true;
        newsByTopicId = [];
        print("left error ${l.toString()}");

      }, (r) {
        newsByTopicId = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
      print('catch error${e.toString()}');
      newsByTopicId = [];

    }
    isLoading = false;
  }
}
