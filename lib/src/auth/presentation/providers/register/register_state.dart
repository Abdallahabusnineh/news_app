class RegisterState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool showPassword;
  final bool showConfirmedPassword;
  final bool rememberMe;

  RegisterState({required this.isInitial, required this.isLoading, required this.isSuccess, required this.isError, required this.showPassword, required this.showConfirmedPassword, required this.rememberMe});




  // To copy the current state and update the values
  RegisterState copyWith({bool? rememberMe,bool? isLoading, bool? isSuccess, bool? isError,bool ?isInitial,bool ?showPassword,bool ?showConfirmedPassword}) {
    return RegisterState(
      rememberMe: rememberMe ?? this.rememberMe,
      showConfirmedPassword: showConfirmedPassword ?? this.showConfirmedPassword,
      showPassword: showPassword ?? this.showPassword,
        isInitial:  isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,);
  }
}