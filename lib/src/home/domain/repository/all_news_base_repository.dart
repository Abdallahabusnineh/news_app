import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/home/data/models/all_news_model.dart';
import 'package:dartz/dartz.dart';
abstract class AllNewsBaseRepository {
  Future<Either<Failure, List<AllNewsModel>>> getAllNews();
}