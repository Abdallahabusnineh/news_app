import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/new_sources/data/datasource/new_source_datasource.dart';
import 'package:news_app/src/new_sources/data/model/new_source_model.dart';
import 'package:news_app/src/new_sources/data/model/your_following_models.dart';
import 'package:news_app/src/new_sources/data/repository/newsource_repository.dart';

final newSourceChangeNotifierProviderTest =
    ChangeNotifierProvider((ref) => NewsourceNotifier());

class NewsourceNotifier extends ChangeNotifier {
  NewsourceNotifier() {
    getSources('');
  }
  NewSourceRepository newSourceRepository =
      NewSourceRepository(baseNewSourceDataSource: NewSourceDataSource());
  List<YourFollowingModels> followSources = [];

  List<NewSourceModel> sources = [];

 /* bool _isFollowing = false;

  bool get isFollowing => _isFollowing;

  set isFollowing(bool isFollowing) {
    _isFollowing = isFollowing;
    notifyListeners();
  }*/

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool isSuccess) {
    _isSuccess = isSuccess;
    notifyListeners();
  }

  bool _isError = false;

  bool get isError => _isError;

  set isError(bool isError) {
    _isError = isError;
    notifyListeners();
  }

  int _selectedId = 0;

  int get selectedId => _selectedId;

  set selectedId(int selectedId) {
    _selectedId = selectedId;
    notifyListeners();
  }

  bool _toggleFollowUpdate = false;
  bool get toggleFollowUpdate => _toggleFollowUpdate;

  set toggleFollowUpdate(bool toggleFollowUpdate) {
    _toggleFollowUpdate = toggleFollowUpdate;
    notifyListeners();
  }




  Future<void> getSources(String text) async {
    isLoading = true;
    try {
      final result = await newSourceRepository.getNewSources(text);
      result.fold((l) {
        isError = true;
      }, (r) async {
        sources = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> getFollowSources() async {
    isLoading = true;
    try {
      final result = await newSourceRepository.yourFollowing();
      result.fold((l) {
        isError = true;
      }, (r) async {
        followSources = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> follow(int id) async {
    toggleFollowUpdate = true;
    selectedId = id;
    try {
      final result = await newSourceRepository.follow(id);
      result.fold((l) {
        isError = true;
      }, (r) {
       // toggleFollow(id);
          sources.firstWhere((element) => element.id == id).isFollowed = r;
          isSuccess = true;
        print('rrrr $r');
        //print('source is followed aaa${sources[index].id} source is ${sources}');
      });
    } catch (e) {
      isError = true;
    }
    toggleFollowUpdate = false;
    selectedId = 0;
  }





//check follow
  Future<void> checkFollow(int index) async {
    isLoading = true;
    try {
      final result = await newSourceRepository.checkFollow(index);
      result.fold((l) {
        isError = true;

      }, (r) {
        isSuccess = true;
        //print('source is followed aaa${sources[index].id} source is ${sources}');
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }
}
