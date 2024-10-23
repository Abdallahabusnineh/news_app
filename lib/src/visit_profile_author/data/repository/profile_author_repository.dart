import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/visit_profile_author/data/datasource/profile_author_datasource.dart';
import 'package:news_app/src/visit_profile_author/data/modules/news_by_user_id_models.dart';
import 'package:news_app/src/visit_profile_author/data/modules/profile_author_models.dart';
import 'package:news_app/src/visit_profile_author/domain/repository/profile_author_base_repository.dart';

class ProfileAuthorRepository extends ProfileAuthorBaseRepository{
  ProfileAuthorBaseDataSource profileAuthorBaseDataSource;
  ProfileAuthorRepository({required this.profileAuthorBaseDataSource});
  @override
  Future<Either<Failure, ProfileAuthorModels>> getProfileAuthor(int authorId) async {
    try {
      final result =await profileAuthorBaseDataSource.getProfileAuthor(authorId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<NewsByUserIdModels>>> getNewsByUserId(int authorId) async {
    try {
      final result =await profileAuthorBaseDataSource.getNewsByUserId(authorId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}