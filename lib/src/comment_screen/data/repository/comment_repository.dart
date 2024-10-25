import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/comment_screen/data/datasource/comment_datasource.dart';
import 'package:news_app/src/comment_screen/data/modules/comment_model.dart';
import 'package:news_app/src/comment_screen/data/modules/create_comment_model.dart';
import 'package:news_app/src/comment_screen/data/modules/edit_comment_model.dart';
import 'package:news_app/src/comment_screen/domain/repository/cooment_base_repository.dart';

class CommentRepository extends CommentBaseRepository {
  CommentBaseDatasource commentBaseDatasource;

  CommentRepository(this.commentBaseDatasource);

  @override
  Future<Either<Failure, List<GetCommentModel>>> getCommentByPostId(
      int postId) async {
    try {
      final result = await commentBaseDatasource.getCommentsByNewsId(postId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CreateCommentModel>> createComment(int postId, String comment) async {
    try {
      final result = await commentBaseDatasource.createComment(postId, comment);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, EditCommentModel>> editComment(int postId, String comment, int commentId) async {
    try {
      final result = await commentBaseDatasource.editComment(postId, commentId, comment);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
