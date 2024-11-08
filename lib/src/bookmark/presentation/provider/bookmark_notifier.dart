import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/bookmark/data/datasource/bookmark_datasource.dart';
import 'package:news_app/src/bookmark/data/modules/all_bookmark_model.dart';
import 'package:news_app/src/bookmark/data/repository/bookmark_repository.dart';

final bookmarkNotifierProvider =
    ChangeNotifierProvider((ref) => BookmarkNotifier(ref));

class BookmarkNotifier extends ChangeNotifier {
  BookmarkNotifier(this.ref) {
    // TODO: implement BookmarkNotifier
    getAllBookmark();
  }

  ChangeNotifierProviderRef<Object?> ref;

  BookmarkRepository bookmarkRepository =
      BookmarkRepository(BookmarkDatasource());

  List<AllBookmarkModel> allBookmark = [];

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

  Future<void> getAllBookmark() async {
    isLoading = true;
    try {
      final result = await bookmarkRepository.getAllBookmark();
      result.fold((l) {
        isError = true;
      }, (r) {
        allBookmark = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> toggleBookmark(int id) async {
    isLoading = true;
    try {
      final result = await bookmarkRepository.addBookmark(id);
      result.fold((l) {
        isError = true;
        print('all bookmark ');
      }, (r) {
        print('all bookmark ss ');
        isSuccess = true;
      });
      getAllBookmark();
    } catch (e) {
      isError = true;
      print('bookmark error ${e.toString()}');
    }
    isLoading = false;
  }

  @override
  notifyListeners();
}
