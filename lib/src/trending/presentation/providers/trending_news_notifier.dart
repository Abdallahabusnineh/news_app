import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/trending/data/datasource/trending_news_datasource.dart';
import 'package:news_app/src/trending/data/models/trending_news_model.dart';
import 'package:news_app/src/trending/data/repository/trending_news_repositoy_imp.dart';
final trendingNewsChangeNotifierProvider = ChangeNotifierProvider((ref) {
  return TrendingNewsNotifier();
});
class TrendingNewsNotifier extends ChangeNotifier {
  TrendingNewsNotifier():super();

  TrendingNewsRepository trendingNewsRepository = TrendingNewsRepository(TrendingNewsDatasource());

  List<TrendingNewsModel> _trendingNews = [];

  List<TrendingNewsModel> get trendingNews => _trendingNews;

  set trendingNews(List<TrendingNewsModel> trendingNews) {
    _trendingNews = trendingNews;
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
  Future<void> getTrendingNews() async {
    isLoading = true;
    try {
      final result = await trendingNewsRepository.getTrendingNews();
      result.fold((l) {
        isError = true;
      }, (r) async {
        trendingNews = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }


}
