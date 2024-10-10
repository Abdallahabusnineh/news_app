import 'package:news_app/src/select_country/domain/entites/countries_entites.dart';

class CountriesModel extends Countries{
  CountriesModel({required super.countryName, required super.id, required super.countryFlag});

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      countryName: json['name'],
      id: json['id'],
      countryFlag: json['flag_url'],
    );
  }

}