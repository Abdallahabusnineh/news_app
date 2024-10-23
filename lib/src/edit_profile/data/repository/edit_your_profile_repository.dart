import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/edit_profile/data/datasourse/edit_your_profile_datasource.dart';
import 'package:news_app/src/edit_profile/data/model/edit_your_profile_model.dart';
import 'package:news_app/src/edit_profile/domain/reopsitory/edit_your_profile_base_repository.dart';

class EditProfileRepository extends EditYourProfileBaseRepository {
  EditYourProfileBaseDataSource editYourProfileBaseDataSource;
  EditProfileRepository(this.editYourProfileBaseDataSource);
  @override
  Future<Either<Failure, EditProfileModel>> editProfile(FormData formData) async {
    try {
      final result = await editYourProfileBaseDataSource.editProfile(formData);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}
