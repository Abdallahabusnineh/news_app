import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/bookmark/data/modules/all_bookmark_model.dart';

abstract  class BookmarkBaseRepository {
  Future<Either<Failure, dynamic>> addBookmark(int postId);
  Future<Either<Failure, List<AllBookmarkModel>>> getAllBookmark();
}