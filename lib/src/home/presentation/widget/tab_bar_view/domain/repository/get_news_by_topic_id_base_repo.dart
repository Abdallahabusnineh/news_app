import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/home/presentation/widget/tab_bar_view/data/models/news_by_topic_id_model.dart';

abstract class  NewsByTopicIdBaseRepository {
  Future<Either<Failure, List<NewsByTopicIdModel>>> getNewsByTopicId(int topicId);
}