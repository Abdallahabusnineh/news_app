import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/profile/data/datasource/my_profile_datasource.dart';
import 'package:news_app/src/profile/data/modules/my_profile_models.dart';
import 'package:news_app/src/profile/domain/repository/my_profile_base_repository.dart';
import 'package:news_app/src/visit_profile_author/data/modules/news_by_user_id_models.dart';

class MyProfileRepository extends MyProfileBaseRepository{
  MyProfileBaseDatasource myProfileBaseDatasource;
  MyProfileRepository({required this.myProfileBaseDatasource});

  @override
  Future<Either<Failure, MyProfileModels>> myProfileInfo() async {
    try {
      final result =await myProfileBaseDatasource.myProfileInfo();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<NewsByUserIdModels>>> getMyNews(int authorId) async {
    try {
      final result =await myProfileBaseDatasource.getNewsByUserId(authorId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }



}