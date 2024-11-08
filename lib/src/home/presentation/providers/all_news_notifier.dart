
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/home/data/datasource/all_news_datasource.dart';
import 'package:news_app/src/home/data/models/all_news_model.dart';
import 'package:news_app/src/home/data/repository/all_news_repositoy_imp.dart';
final allNewsChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return AllNewsNotifier();
});
class AllNewsNotifier extends ChangeNotifier {
  AllNewsNotifier() {
    // TODO: implement AllNewsNotifier
    getAllNews();
  }

  AllNewsRepository allNewsRepository = AllNewsRepository(AllNewsDataSource());

  List<AllNewsModel> _allNews = [];

  List<AllNewsModel> get allNews => _allNews;

  set allNews(List<AllNewsModel> allNews) {
    _allNews = allNews;
    notifyListeners();
  }
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool _isError = false;

  bool get isError => _isError;

  set isError(bool isError) {
    _isError = isError;
    notifyListeners();
  }

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool isSuccess) {
    _isSuccess = isSuccess;
    notifyListeners();
  }
  Future<void> getAllNews() async {
    isLoading = true;
    try {
      final result = await allNewsRepository.getAllNews();
      result.fold((l) {
        isError = true;
      }, (r) async {
        allNews = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }


}
