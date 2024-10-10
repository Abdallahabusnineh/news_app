import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/new_sources/data/model/new_source_model.dart';
import 'package:dartz/dartz.dart';
abstract class NewSourceBaseRepository {

  Future<Either<Failure, List<NewSourceModel>>> getNewSources(String text);
  Future<Either<Failure, bool>> follow(int id);
  Future<Either<Failure, bool>> checkFollow(int id);

}