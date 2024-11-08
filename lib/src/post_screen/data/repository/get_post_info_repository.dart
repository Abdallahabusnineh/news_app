import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/post_screen/data/datasource/get_post_info_datasource.dart';
import 'package:news_app/src/post_screen/data/modules/get_post_info_model.dart';
import 'package:news_app/src/post_screen/domain/repository/get_post_info_base_repository.dart';

class GetPostInfoRepository extends GetPostInfoBaseRepository {
  GetPostInfoBaseDatasource getPostInfoBaseDatasource;

  GetPostInfoRepository(this.getPostInfoBaseDatasource);

  @override
  Future<Either<Failure, GetPostInfoModel>> getPostInfo(int postId) async {
    try {
      final result = await getPostInfoBaseDatasource.getPostInfo(postId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleLikePost(int postId) async {
    try {
      final result = await getPostInfoBaseDatasource.toggleLikePost(postId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
