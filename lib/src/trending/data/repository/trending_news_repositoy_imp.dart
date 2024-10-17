import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/trending/data/datasource/trending_news_datasource.dart';
import 'package:news_app/src/trending/data/models/trending_news_model.dart';
import 'package:news_app/src/trending/domain/repository/trending_news_base_repository.dart';

class TrendingNewsRepository  extends TrendingNewsBaseRepository {
  TrendingNewsBaseDataSource  trendingNewsBaseDataSource;
 TrendingNewsRepository(this.trendingNewsBaseDataSource);
  @override
  Future<Either<Failure, List<TrendingNewsModel>>> getTrendingNews() async {
    try {
      final result = await trendingNewsBaseDataSource.getTrendingNews();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}