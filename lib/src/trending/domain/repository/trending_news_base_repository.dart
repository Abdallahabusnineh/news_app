import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/home/data/models/all_news_model.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/src/trending/data/models/trending_news_model.dart';
abstract class TrendingNewsBaseRepository {
  Future<Either<Failure, List<TrendingNewsModel>>> getTrendingNews();
}