
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/select_country/data/datasource/countries_data_source.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_state.dart';

import '../../data/model/countries_model.dart';
import '../../data/repositories/countries_repository.dart';

final dataSourceProvider = Provider<BaseCountriesDataSource>((ref) {
  return CountriesDataSource();
});

final countriesRepositoryProvider = Provider<CountriesRepository>((ref) {
  return CountriesRepository(baseCountriesDataSource:  ref.watch(dataSourceProvider));
});


final countriesNotifierProvider = StateNotifierProvider<CountriesNotifier, CountriesState>((ref) {
  return CountriesNotifier(ref.watch(countriesRepositoryProvider));
});

class CountriesNotifier extends StateNotifier<CountriesState> {
  CountriesNotifier(this.countriesRepository) : super(
    CountriesState(isLoading: false, isError: false, isSuccess: false, isInitial: true, isCountrySelected: false),
  ) {
    getCountries('');
  }
List <CountriesModel> countries = [];
  final CountriesRepository countriesRepository;
  bool isCountrySelected = false;

  Future<void> getCountries(String text) async {
    state = state.copyWith(isLoading: true,isInitial: false);
    try {
      final result = await countriesRepository.getCountries(text);
      result.fold((l) {
        state = state.copyWith(isError: true, isLoading: false);
      }, (r) {
        countries = r;
        state = state.copyWith(isLoading: false, isSuccess: true,);
      });
    } catch (e) {
      state = state.copyWith(isError: true, isLoading: false);
    }
  }
  void selectCountry()  {
   isCountrySelected=!isCountrySelected;
   state = state.copyWith(isCountrySelected: isCountrySelected);
  }
  void searchCountry(String text) {
    state = state.copyWith(isLoading: true);
    getCountries(text);
    state = state.copyWith(isSuccess: true,isLoading: false);
  }
}