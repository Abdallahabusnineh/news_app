import 'package:dio/dio.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/edit_profile/data/model/edit_your_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class EditYourProfileBaseRepository {
  Future<Either<Failure, EditProfileModel>> editProfile(FormData formData);
}
