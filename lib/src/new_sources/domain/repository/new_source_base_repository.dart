import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/new_sources/data/model/new_source_model.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/src/new_sources/data/model/your_following_models.dart';
abstract class NewSourceBaseRepository {

  Future<Either<Failure, List<NewSourceModel>>> getNewSources(String text);
  Future<Either<Failure, bool>> follow(int id);
  Future<Either<Failure, bool>> checkFollow(int id);
  Future<Either<Failure, List<YourFollowingModels>>> yourFollowing();

}