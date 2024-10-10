import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/new_sources/data/datasource/new_source_datasource.dart';
import 'package:news_app/src/new_sources/data/model/new_source_model.dart';
import 'package:news_app/src/new_sources/data/repository/newsource_repository.dart';


/*
final newSourceDataSourceProvider = Provider<BaseNewSourceDataSource>((ref) {
  return NewSourceDataSource();
});
final newSourceRepositoryProvider = Provider<NewSourceRepository>((ref) {
  return NewSourceRepository(
      baseNewSourceDataSource: ref.watch(newSourceDataSourceProvider));
});
final newSourceNotifierProvider =
    StateNotifierProvider<NewSourceNotifier, NewSourceState>((ref) {
  return NewSourceNotifier(ref.watch(newSourceRepositoryProvider));
});

class NewSourceNotifier extends StateNotifier<NewSourceState> {
  NewSourceNotifier(this.newSourceRepository)
      : super(NewSourceState(
          isInitial: true,
          isLoading: false,
          isSuccess: false,
          isError: false,
          followIsError: false,
          followIsSuccess: false,
          followIsLoading: false,
          checkFollowIsLoading: false,
          checkFollowIsError: false,
          checkFollowIsSuccess: false,
        )) {
    getSources('');
  }

  List<NewSourceModel> sources = [];
  final NewSourceRepository newSourceRepository;
  final Map<String, bool> checkFollow = {};




  Future<void> getSources(String text) async {
    state = state.copyWith(isLoading: true, isInitial: false);
    try {
      final result = await newSourceRepository.getNewSources(text);
      result.fold((l) {
        state = state.copyWith(isError: true, isLoading: false);
      }, (r) {
        sources = r;
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
        );
      });
    } catch (e) {
      state = state.copyWith(isError: true, isLoading: false);
    }
  }

  FutureOr<bool> follow(int index) async {
    state = state.copyWith(followIsLoading: true, isInitial: false);
    try {
      final result = await newSourceRepository.follow(index);
      result.fold((l) {
        print('isFollowing ');
        state = state.copyWith(followIsError: true, followIsLoading: false);
        return false;
      }, (r) {
        print('isFollowing abood $r');
        state = state.copyWith(
          followIsLoading: false,
          followIsSuccess: true,

        );



        return true;
      });
    } catch (e) {
      print('isFollowing catch ${e.toString()}');

      state = state.copyWith(followIsError: true, followIsLoading: false);
      return false;
    }
    return false;
  }





*/
/*bool toggleFollow(int index) {
  isFollowing = !isFollowing;
  print('toggleFollow $isFollowing');
  state = state.copyWith(checkFollowIsSuccess: true, checkFollowIsLoading: false,);
  return isFollowing;
}*/ /*

 */
/* FutureOr<bool> checkFollow(int index) async {
    state = state.copyWith(checkFollowIsLoading: true);
    try {
      final result = await newSourceRepository.checkFollow(index);
      result.fold((l) {
        print('checkFollow isLeft $l');
        state = state.copyWith(
            checkFollowIsError: true, checkFollowIsLoading: false);
      }, (r) {
        isFollowing = r;
        print('checkFollow isRight $r');
        state = state.copyWith(
          checkFollowIsLoading: false,
          checkFollowIsSuccess: true,
        );
      });
    } catch (e) {
      print('checkFollow catch ${e.toString()}');
    }
    return isFollowing;
  }*/ /*

}
*/

final newSourceChangeNotifierProvider =
    ChangeNotifierProvider((ref) => NewSourceChangeNotifier());

class NewSourceChangeNotifier extends ChangeNotifier {
  NewSourceChangeNotifier() {
    /*print('NewSourceChangeNotifier');
    for(int i = 1; i < sources.length; i++){
      getSources('',sources[i].id);
    }*/
    getSources('');
  }


  NewSourceRepository newSourceRepository =
      NewSourceRepository(baseNewSourceDataSource: NewSourceDataSource());

  Future<void> getSources(String text) async {
    isLoading = true;
    try {
      final result = await newSourceRepository.getNewSources(text);
      result.fold((l) {
        isError = true;
      }, (r) async {
        sources = r;
        for (int i = 0; i < sources.length; i++) {
          if (await userFollowing(sources[i].id)) {
            sources[i].isFollowed = true;
          /*  print(
                'source is followed ${sources[i].isFollowed} source is ${sources}');
          */} else {
            sources[i].isFollowed = false;
            print(
                'source is followed ${sources[i].isFollowed} source is $sources');
          }
        }
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

//check follow in source
//***********************

  bool _isFollowing = false;

  bool get isFollowing => _isFollowing;

  set isFollowing(bool isFollowing) {
    _isFollowing = isFollowing;
    notifyListeners();
  }

  bool toggleFollowCheck(int index) {
    isFollowing = !isFollowing;
    return isFollowing;
  }

  // add follow
  Future<void> follow(int index) async {
    toggleFollowUpdate=true;
    try {
      final result = await newSourceRepository.follow(index);
      result.fold((l) {
        isError = true;
        isLoading = false;
      }, (r) {
        if (!r) {
          sources[index].isFollowed = true;
        }
        else {
          sources[index].isFollowed = false;
        }
        //print('source is followed aaa${sources[index].id} source is ${sources}');
      });
    } catch (e) {
      isError = true;
    }
    toggleFollowUpdate=false;
  }

  Future<bool> userFollowing(int index) async {
      final result = await newSourceRepository.checkFollow(index);
      return result.fold(
            (l) {
          print('failed ${l.toString()}');
          return false; // Return false if the operation failed
        },
            (r) {
          print('rrrrrrrrrrr $r');
          return r; // Return the actual result if the operation succeeded
        },
      );

  }

  List<NewSourceModel> _sources = [];

  List<NewSourceModel> get sources => _sources;

  set sources(List<NewSourceModel> sources) {
    _sources = sources;
    notifyListeners();
  }

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool isSuccess) {
    _isSuccess = isSuccess;
    notifyListeners();
  }

bool _toggleFollowUpdate = false;
  bool get toggleFollowUpdate => _toggleFollowUpdate;
  set toggleFollowUpdate(bool toggleFollowUpdate) {
    _toggleFollowUpdate = toggleFollowUpdate;
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

  /*List<int> _checkFollow = [];

  List<int> get checkFollow => _checkFollow;*/

  // toggle follower to the list
/*  void toggleFollow(int index) {
    if (_checkFollow.contains(index)) {
      _checkFollow.remove(index);
    } else {
      _checkFollow.add(index);
    }
    notifyListeners();
  }*/
  /*bool isFollowed(int index) {
    return _checkFollow.contains(index);
  }*/
bool youFollow(int index){
    return _sources[index].isFollowed;
}
}
