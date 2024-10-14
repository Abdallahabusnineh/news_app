import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/topics/data/model/topics_model.dart';
import 'package:news_app/src/topics/data/repositories/topics_repository.dart';
import 'package:news_app/src/topics/presentation/providers/topics_state.dart';

import '../../data/datasource/topics_data_source.dart';

final topicsDataSourceProvider = Provider<BaseTopicsDataSource>((ref) {
  return TopicsDataSource();
});
final topicsRepositoryProvider = Provider<TopicsRepository>((ref) {
  return TopicsRepository(baseTopicsDataSource: ref.watch(topicsDataSourceProvider));
});
final topicsNotifierProvider =
    StateNotifierProvider<TopicsNotifier, TopicsState>((ref) {
  return TopicsNotifier(
    ref.watch(topicsRepositoryProvider),
  );
});

class TopicsNotifier extends StateNotifier<TopicsState> {
  TopicsNotifier(this.topicsRepository)
      : super(TopicsState(
            isError: false,
            isLoading: false,
            isSuccess: false,
            isInitial: true,
            isTopicSelected: false)) {
    getTopics('');
  }
  TopicsRepository topicsRepository;
  List<TopicsModel> topics = [];
 static List<int> selectedTopics = [];
bool isTopicSelected = false;
  Future<void> getTopics(String text) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await topicsRepository.getTopics(text);
      result.fold((l) {
        state = state.copyWith(isError: true, isLoading: false);
      }, (r) {
        topics = r;
        state = state.copyWith(isLoading: false, isSuccess: true,);
      });
    } catch (e) {
      state = state.copyWith(isError: true, isLoading: false);
    }
  }
void selectTopic(int index) {
  if (selectedTopics.contains(index)) {
    selectedTopics.remove(index);
  } else {
    selectedTopics.add(index);
  }
print('selectedTopics $selectedTopics');
  state = state.copyWith(isTopicSelected: true);
}
  void searchTopic(String text) {
    state = state.copyWith(isLoading: true);
    getTopics(text);
    state = state.copyWith(isSuccess: true,isLoading: false);
  }
}
