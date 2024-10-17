import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/home/data/datasource/all_news_datasource.dart';
import 'package:news_app/src/home/data/models/all_news_model.dart';
import 'package:news_app/src/home/domain/repository/all_news_base_repository.dart';

class AllNewsRepository extends AllNewsBaseRepository {
  AllNewsBaseDataSource allNewsBaseDataSource;
  AllNewsRepository(this.allNewsBaseDataSource);
  @override
  Future<Either<Failure, List<AllNewsModel>>> getAllNews() async {
    try {
      final result = await allNewsBaseDataSource.getAllNews();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}