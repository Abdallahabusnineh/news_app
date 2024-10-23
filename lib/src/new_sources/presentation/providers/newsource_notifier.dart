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
    getFollowSources();
    getSources('');
  }

  NewSourceRepository newSourceRepository =
      NewSourceRepository(baseNewSourceDataSource: NewSourceDataSource());
  List<NewSourceModel> _sources = [];

  List<NewSourceModel> get sources => _sources;
  bool _isFollowing = false;
bool get isFollowing => _isFollowing;

  set isFollowing(bool isFollowing) {
    _isFollowing = isFollowing;
    notifyListeners();
  }
  set sources(List<NewSourceModel> sources) {
    _sources = sources;
    notifyListeners();
  }

  List<YourFollowingModels> _followSources = [];

  List<YourFollowingModels> get followSources => _followSources;

  set followSources(List<YourFollowingModels> sources) {
    _followSources = sources;
    notifyListeners();
  }

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
    toggleFollowUpdate=true;
    try {
      final result = await newSourceRepository.follow(id);
      result.fold((l) {
        isError = true;
      }, (r) {
        toggleFollow(id);
        print('true');
        //print('source is followed aaa${sources[index].id} source is ${sources}');
      });
    } catch (e) {
      isError = true;
    }
    toggleFollowUpdate=false;
  }
  Future<void> checkFollow(int index) async {
    isLoading = true;
    try {
      final result = await newSourceRepository.checkFollow(index);
      result.fold((l) {
        isFollowing = false;
        isError = true;

      }, (r) {
      isFollowing = r;
      isSuccess = true;
        //print('source is followed aaa${sources[index].id} source is ${sources}');
      });
    } catch (e) {
      isFollowing = false;
      isError = true;
    }
    isLoading = false;
  }

  bool userFollowing(int id) {
    for (int i = 0; i < followSources.length; i++) {
      if (followSources[i].followedId == id) {

       return true;
      }

    }
    return false;
  }

  void toggleFollow(int index) {
    if (sources[index].isFollowed) {
      sources[index].isFollowed = false;
    } else {
      sources[index].isFollowed = true;
    }
    notifyListeners();
  }
 /* bool checkFollow(int index) {

  }
*/

}
