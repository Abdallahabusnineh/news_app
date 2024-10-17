import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/topics/data/model/topics_by_search_model.dart';
import 'package:news_app/src/topics/data/model/topics_model.dart';

abstract class BaseTopicsRepository {
  Future<Either<Failure,List<TopicsBySearchModel>>> getTopicsBySearch( String text);
  Future<Either<Failure,List<TopicsModel>>> getTopics();
 }