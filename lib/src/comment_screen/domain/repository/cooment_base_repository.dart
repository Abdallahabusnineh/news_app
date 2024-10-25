import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/comment_screen/data/modules/comment_model.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/src/comment_screen/data/modules/create_comment_model.dart';
import 'package:news_app/src/comment_screen/data/modules/edit_comment_model.dart';

abstract class CommentBaseRepository {
  Future<Either<Failure, List<GetCommentModel>>> getCommentByPostId(int postId);
  Future<Either<Failure, CreateCommentModel>> createComment(int postId,String comment);
  Future<Either<Failure, EditCommentModel>> editComment(int postId,String comment,int commentId);
}
