import 'package:dartz/dartz.dart';
import 'package:dio/src/form_data.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/create_news/data/datasource/create_new_post_datasource.dart';
import 'package:news_app/src/create_news/data/modules/create_new_post_models.dart';
import 'package:news_app/src/create_news/domain/repository/create_new_post_base_repostitory.dart';

class CreateNewPostRepository extends CreateNewPostBaseRepository {
  CreateNewPostBaseDataSource createNewPostBaseDataSource;

  CreateNewPostRepository(this.createNewPostBaseDataSource);

  @override
  Future<Either<Failure, CreateNewPostModels>> createNewPost(
      FormData formData) async {
    try {
      final result = await createNewPostBaseDataSource.createPost(formData);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
