import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/profile/data/datasource/my_profile_datasource.dart';
import 'package:news_app/src/profile/data/modules/my_profile_models.dart';
import 'package:news_app/src/profile/data/repository/my_profile_repository.dart';
import 'package:news_app/src/visit_profile_author/data/modules/news_by_user_id_models.dart';


final myProfileNotifierProvider =
  ChangeNotifierProvider((ref) => MyProfileNotifier());
class MyProfileNotifier extends ChangeNotifier {
  MyProfileNotifier() {
    getMyProfileInfo();
  }

  MyProfileRepository myProfileRepository = MyProfileRepository(
      myProfileBaseDatasource: MyProfileDatasource());
  MyProfileModels ?myProfileModels;
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

  Future<void> getMyProfileInfo() async {
    isLoading = true;
    /*myProfileModels = null;
    newsByUserId = [];
    recentNewsByUserId = [];*/
    try {
      final result = await myProfileRepository.myProfileInfo();
      result.fold((l) {
        isError = true;
      }, (r) async {
        myProfileModels = r;
        getNewsByUserId(r.id);
      //  getNewsByUserId();
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
      final result = await myProfileRepository.getMyNews(authorId);
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



}
