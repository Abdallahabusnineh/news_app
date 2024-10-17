import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/topics/data/datasource/topics_data_source.dart';
import 'package:news_app/src/topics/data/model/topics_by_search_model.dart';
import 'package:news_app/src/topics/data/model/topics_model.dart';
import 'package:news_app/src/topics/domain/reopsitory/base_topics_repository.dart';

class TopicsRepository extends BaseTopicsRepository {
  BaseTopicsDataSource baseTopicsDataSource;
  TopicsRepository({required this.baseTopicsDataSource});

  @override
  Future<Either<Failure, List<TopicsBySearchModel>>> getTopicsBySearch(String text) async {
    try {
      final result = await baseTopicsDataSource.getTopicsBySearch(text);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<TopicsModel>>> getTopics() async {
    try {
      final result = await baseTopicsDataSource.getTopics();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
