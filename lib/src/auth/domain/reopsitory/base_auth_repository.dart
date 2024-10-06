import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/auth/data/model/user_model.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, UserModel>> login(String username, String password);
  Future<Either<Failure, UserModel>> register(String username, String email, String password,String confirmPassword);
}