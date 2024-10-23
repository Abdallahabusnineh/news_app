import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/create_news/data/modules/create_new_post_models.dart';

abstract class CreateNewPostBaseRepository {
  Future<Either<Failure, CreateNewPostModels>> createNewPost(FormData formData);
}