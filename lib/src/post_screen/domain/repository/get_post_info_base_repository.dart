import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/post_screen/data/modules/get_post_info_model.dart';

abstract class GetPostInfoBaseRepository {
  Future<Either<Failure, GetPostInfoModel>> getPostInfo(int postId);
  Future<Either<Failure, bool>> toggleLikePost(int postId);
}