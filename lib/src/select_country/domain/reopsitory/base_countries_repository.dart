import 'package:dartz/dartz.dart';
import 'package:news_app/shared/core/error/failure.dart';
import 'package:news_app/src/select_country/data/model/countries_model.dart';

abstract class BaseCountriesRepository {
  Future<Either<Failure,List<CountriesModel>>> getCountries( String text);
 }