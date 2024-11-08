import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/visit_profile_author/data/datasource/profile_author_datasource.dart';
import 'package:news_app/src/visit_profile_author/data/modules/news_by_user_id_models.dart';
import 'package:news_app/src/visit_profile_author/data/modules/profile_author_models.dart';
import 'package:news_app/src/visit_profile_author/data/repository/profile_author_repository.dart';
final profileAuthorProvider =
  ChangeNotifierProvider((ref) => ProfileAuthorNotifier());
class ProfileAuthorNotifier extends ChangeNotifier {
  ProfileAuthorNotifier() {
    // TODO: implement ProfileAuthorNotifier
  }

  ProfileAuthorRepository profileAuthorRepository = ProfileAuthorRepository(
      profileAuthorBaseDataSource: ProfileAuthorDatasource());
  ProfileAuthorModels ?profileAuthorModels;
  List<NewsByUserIdModels> newsByUserId = [];
  List<NewsByUserIdModels> recentNewsByUserId = [];
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

  Future<void> getProfileAuthor(int authorId) async {
    isLoading = true;
    profileAuthorModels = null;
    newsByUserId = [];
    recentNewsByUserId = [];
    try {
      final result = await profileAuthorRepository.getProfileAuthor(authorId);
      result.fold((l) {
        isError = true;
      }, (r) async {
        profileAuthorModels = r;
        getNewsByUserId(authorId);
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> getNewsByUserId(int authorId) async {
    isLoading = true;
    try {
      final result = await profileAuthorRepository.getNewsByUserId(authorId);
      result.fold((l) {
        isError = true;
      }, (r) async {
        newsByUserId=r;
        recentNewsByUserId=r;
        recentNewsByUserId.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }


 /* Future<void> getRecentNewsByUserId(int authorId) async {
    isLoading = true;
    try {
      final result = await profileAuthorRepository.getNewsByUserId(authorId);
      result.fold((l) {
        isError = true;
      }, (r) async {
        recentNewsByUserId=r;
        recentNewsByUserId.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }*/
/*@override
  void dispose() {
    // TODO: implement dispose
    if (profileAuthorModels != null) {
      profileAuthorModels = null;
    }
    newsByUserId.clear();
    super.dispose();
  }*/
}
