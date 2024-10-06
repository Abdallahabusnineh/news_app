class LoginState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool showPassword;
  final bool rememberMe;

  LoginState({required this.isInitial, required this.isLoading, required this.isSuccess, required this.isError, required this.showPassword, required this.rememberMe});




  // To copy the current state and update the values
  LoginState copyWith({bool ?rememberMe,bool? isLoading, bool? isSuccess, bool? isError,bool ?isInitial,bool ?showPassword}) {
    return LoginState(
      rememberMe:rememberMe ?? this.rememberMe,
      showPassword: showPassword ?? this.showPassword,
        isInitial:  isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,);
  }
}