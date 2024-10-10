class TopicsState {
  final bool isInitial;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool isTopicSelected;

  TopicsState(
      {
        required this.isTopicSelected,
        required this.isInitial,
        required this.isLoading,
        required this.isSuccess,
        required this.isError});

  TopicsState copyWith(
      {bool? isInitial, bool? isLoading, bool? isSuccess, bool? isError, bool? isTopicSelected}) {
    return TopicsState(
        isTopicSelected: isTopicSelected ?? this.isTopicSelected,
        isInitial: isInitial ?? this.isInitial,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError);
  }
}
