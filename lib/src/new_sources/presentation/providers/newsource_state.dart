class NewSourceState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool followIsLoading;

  final bool followIsSuccess;
  final bool followIsError;
  final bool checkFollowIsLoading;

  final bool checkFollowIsSuccess;
  final bool checkFollowIsError;

  NewSourceState(
      {required this.isInitial,
      required this.isLoading,
      required this.isSuccess,
      required this.isError,
      required this.followIsLoading,
      required this.followIsSuccess,
      required this.followIsError,
      required this.checkFollowIsLoading,
      required this.checkFollowIsSuccess,
      required this.checkFollowIsError});

  NewSourceState copyWith(
      {bool? isInitial,
      bool? isLoading,
      bool? isSuccess,
      bool? isError,
      bool? followIsLoading,
      bool? followIsSuccess,
      bool? followIsError,
      bool? checkFollowIsLoading,
      bool? checkFollowIsSuccess,
      bool? checkFollowIsError}) {
    return NewSourceState(
        checkFollowIsError: checkFollowIsError ?? this.checkFollowIsError,
        checkFollowIsLoading: checkFollowIsLoading ?? this.checkFollowIsLoading,
        checkFollowIsSuccess: checkFollowIsSuccess ?? this.checkFollowIsSuccess,
        followIsError: followIsError ?? this.followIsError,
        followIsSuccess: followIsSuccess ?? this.followIsSuccess,
        followIsLoading: followIsLoading ?? this.followIsLoading,
        isInitial: isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError);
  }
}
