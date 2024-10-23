import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/profile/data/modules/my_profile_models.dart';
import 'package:news_app/src/visit_profile_author/data/modules/news_by_user_id_models.dart';

abstract class MyProfileBaseRepository {
  Future<Either<Failure, MyProfileModels>> myProfileInfo();
  Future<Either<Failure, List<NewsByUserIdModels>>> getMyNews(int authorId);
}