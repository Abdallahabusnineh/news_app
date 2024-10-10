import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/exceptions.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/select_country/data/datasource/countries_data_source.dart';
import 'package:news_app/src/select_country/data/model/countries_model.dart';

import 'package:news_app/src/select_country/domain/reopsitory/base_countries_repository.dart';

class CountriesRepository extends BaseCountriesRepository{
  BaseCountriesDataSource baseCountriesDataSource;
  CountriesRepository({required this.baseCountriesDataSource});

  @override
  Future<Either<Failure, List<CountriesModel>>> getCountries(String text) async {
     try {
    final result = await baseCountriesDataSource.getCountries(text);
    return Right(result);
    } on ServerExceptions catch (e) {
    return Left(ServerFailure(e.errorMessageModel.message));
    }
  }


}