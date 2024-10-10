class CountriesState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool isCountrySelected;

  CountriesState(
      {
        required this.isCountrySelected,
        required this.isInitial,
      required this.isLoading,
      required this.isSuccess,
      required this.isError});

  CountriesState copyWith(
      {bool? isInitial, bool? isLoading, bool? isSuccess, bool? isError, bool? isCountrySelected}) {
    return CountriesState(
        isCountrySelected: isCountrySelected ?? this.isCountrySelected,
        isInitial: isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError);
  }
}
