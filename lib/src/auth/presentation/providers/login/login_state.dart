class LoginState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool showPassword;
  final bool rememberMe;
  final bool showSuffixIconForUserName;
  final bool filledColor;

  LoginState({required this.isInitial,required this.filledColor, required this.isLoading, required this.isSuccess, required this.isError, required this.showPassword, required this.rememberMe,required this.showSuffixIconForUserName});




  // To copy the current state and update the values
  LoginState copyWith({bool ?rememberMe,bool? isLoading,bool ?filledColor, bool? isSuccess, bool? isError,bool ?isInitial,bool ?showPassword,bool ?showSuffixIconForUserName}) {
    return LoginState(
      filledColor: filledColor ?? this.filledColor,
      rememberMe:rememberMe ?? this.rememberMe,
      showPassword: showPassword ?? this.showPassword,
        isInitial:  isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        showSuffixIconForUserName: showSuffixIconForUserName ?? this.showSuffixIconForUserName,
        isError: isError ?? this.isError,);
  }
}