import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/new_sources/data/datasource/new_source_datasource.dart';
import 'package:news_app/src/new_sources/domain/repository/new_source_base_repository.dart';

import '../../../../shared/core/error/exceptions.dart';
import '../model/new_source_model.dart';
class NewSourceRepository extends NewSourceBaseRepository {
  BaseNewSourceDataSource baseNewSourceDataSource;
  NewSourceRepository({required this.baseNewSourceDataSource});
  @override
  Future<Either<Failure, List<NewSourceModel>>> getNewSources(String text) async {
    try {
      final result = await baseNewSourceDataSource.getNewSource(text);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, bool>> follow(int id) async {
    try {

      final result = await baseNewSourceDataSource.follow(id);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

 @override
  Future<Either<Failure, bool>> checkFollow(int id) async {
   try {
     final result = await baseNewSourceDataSource.checkFollow(id);
     return Right(result);
   } on ServerExceptions catch (e) {
     return Left(ServerFailure(e.errorMessageModel.message));
   }
  }


}