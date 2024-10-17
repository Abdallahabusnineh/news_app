import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/visit_profile_author/data/modules/profile_author_models.dart';

abstract class ProfileAuthorBaseRepository {
  Future<Either<Failure, ProfileAuthorModels>> getProfileAuthor(int authorId);
}