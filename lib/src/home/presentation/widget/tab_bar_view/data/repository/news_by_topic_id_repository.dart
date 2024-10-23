import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/data/datasource/news_by_topic_id_datasource.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/data/models/news_by_topic_id_model.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/domain/repository/get_news_by_topic_id_base_repo.dart';

class NewsByTopicIdRepository extends NewsByTopicIdBaseRepository {
  NewsByTopicIdBaseDataSource newsByTopicIdBaseDataSource;

  NewsByTopicIdRepository({required this.newsByTopicIdBaseDataSource});

  @override
  Future<Either<Failure, List<NewsByTopicIdModel>>> getNewsByTopicId(
      int topicId) async {
    try {
      final result =
          await newsByTopicIdBaseDataSource.getNewsByTopicId(topicId);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
