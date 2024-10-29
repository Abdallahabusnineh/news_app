class RegisterState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool showPassword;
  final bool showConfirmedPassword;
  final bool rememberMe;
  final bool showSuffixIconForUserName;
  final bool filledColor;

  RegisterState({required this.isInitial, required this.filledColor,required this.showSuffixIconForUserName,required this.isLoading, required this.isSuccess, required this.isError, required this.showPassword, required this.showConfirmedPassword, required this.rememberMe});




  // To copy the current state and update the values
  RegisterState copyWith({bool? rememberMe,bool? isLoading, bool? isSuccess, bool? filledColor,bool ?showSuffixIconForUserName,bool? isError,bool ?isInitial,bool ?showPassword,bool ?showConfirmedPassword}) {
    return RegisterState(
      filledColor: filledColor ?? this.filledColor,
      showSuffixIconForUserName: showSuffixIconForUserName ?? this.showSuffixIconForUserName,
      rememberMe: rememberMe ?? this.rememberMe,
      showConfirmedPassword: showConfirmedPassword ?? this.showConfirmedPassword,
      showPassword: showPassword ?? this.showPassword,
        isInitial:  isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,);
  }
}