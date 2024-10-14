import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/fill_profile/data/datasourse/fill_your_profile_datasource.dart';
import 'package:news_app/src/fill_profile/data/model/fill_your_profile_model.dart';
import 'package:news_app/src/fill_profile/domain/reopsitory/fill_your_profile_base_repository.dart';

class CreateProfileRepository extends CreateProfileBaseRepository {
  BaseDataSourceCreateYourProfile baseDataSourceCreateYourProfile;
  CreateProfileRepository(this.baseDataSourceCreateYourProfile);
  @override
  Future<Either<Failure, CreateProfileModel>> createProfile(FormData formData) async {
    try {
      final result = await baseDataSourceCreateYourProfile.createProfile(formData);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}