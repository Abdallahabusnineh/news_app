import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/auth/data/datasource/auth_data_source.dart';
import 'package:news_app/src/auth/data/model/user_model.dart';
import 'package:news_app/src/auth/domain/reopsitory/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  BaseAuthDataSource baseAuthDataSource;

  AuthRepository({required this.baseAuthDataSource});

  @override
  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    try {
      final result = await baseAuthDataSource.login(username, password);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      String username, String email, String password, String confirmPassword) async {
    try {
      final result = await baseAuthDataSource.register(
          username, email, password, confirmPassword);
      print('result $result');
      return Right(result);
    } on ServerExceptions catch (e) {
      print('result ${e.errorMessageModel.message}');
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    // TODO: implement logout
    try {
      final result = await baseAuthDataSource.logout();
      print('result logout $result');
      return Right(result);
    } on ServerExceptions catch (e) {
      print('result logout${e.errorMessageModel.message}');
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
