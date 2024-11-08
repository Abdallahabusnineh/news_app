import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/post_screen/data/datasource/get_post_info_datasource.dart';
import 'package:news_app/src/post_screen/data/modules/get_post_info_model.dart';
import 'package:news_app/src/post_screen/data/repository/get_post_info_repository.dart';

final getPostInfoNotifierProvider = ChangeNotifierProvider((ref) {
  return GetPostInfoNotifier();
});

class GetPostInfoNotifier extends ChangeNotifier {
  GetPostInfoNotifier();

  GetPostInfoRepository getPostInfoRepository =
      GetPostInfoRepository(GetPostInfoDatasource());
  GetPostInfoModel? getPostInfoModel;

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

  Future<void> getPostInfo(int postId) async {
    isLoading = true;
    try {
      final result = await getPostInfoRepository.getPostInfo(postId);
      result.fold((l) {
        isError = true;
      }, (r) {
        getPostInfoModel = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
      print('ssssss ${e.toString()}');
    }
    isLoading = false;
  }

  Future<void> toggleLikePost(int postId) async {

    try {
      final result = await getPostInfoRepository.toggleLikePost(postId);
      result.fold((l) {
        isError = true;
      }, (r) {
        getPostInfoModel!.isLiked=r;
        getPostInfoModel!.isLiked? getPostInfoModel!.likeCount++: getPostInfoModel!.likeCount--;
        print('like ${getPostInfoModel!.likeCount}');
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }
}
