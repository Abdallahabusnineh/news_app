import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/visit_profile_author/data/datasource/profile_author_datasource.dart';
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
    try {
      final result = await profileAuthorRepository.getProfileAuthor(authorId);
      result.fold((l) {
        isError = true;
      }, (r) async {
        profileAuthorModels = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }
}
