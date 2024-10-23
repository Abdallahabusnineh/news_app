import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/auth/data/datasource/auth_data_source.dart';
import 'package:news_app/src/bookmark/data/datasource/bookmark_datasource.dart';
import 'package:news_app/src/bookmark/data/modules/add_fav_bookmark_model.dart';
import 'package:news_app/src/bookmark/data/modules/all_bookmark_model.dart';
import 'package:news_app/src/bookmark/domain/repository/bookmark_base_repository.dart';

class BookmarkRepository extends BookmarkBaseRepository {
  BookmarkBaseDatasource bookmarkBaseDatasource;

  BookmarkRepository(this.bookmarkBaseDatasource);

  @override
  Future<Either<Failure, dynamic>> addBookmark(int postId) async {
    try {
      final result = await bookmarkBaseDatasource.addFavBookmark(postId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<AllBookmarkModel>>> getAllBookmark() async {
    try {
      final result = await bookmarkBaseDatasource.getAllBookmark();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
