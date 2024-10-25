abstract class ApiUrls {
  static String baseUrl = 'http://172.105.73.38/api';

  static String register() => '$baseUrl/auth/register';

  static String login() => '$baseUrl/auth/login';

  static String getCountries() => '$baseUrl/search/countries';

  static String getTopicsBySearch() => '$baseUrl/search/topics';

  static String getTopics() => '$baseUrl/topics';
  static String toggleTopic(int topicId) => '$baseUrl/user/profile/topic/$topicId/toggle';

  static String searchInNewSources() => '$baseUrl/search/authors';

  static String checkFollowing(int id) => '$baseUrl/follow/$id';

  static String follow(int id) => '$baseUrl/follow/$id';

  static String createYourProfile() => '$baseUrl/user/profile/create';
  static String editYourProfile() => '$baseUrl/user/profile/edit';

  static String yourFollowing() => '$baseUrl/following';

  static String logout() => '$baseUrl/auth/logout';

  static String getAllNews() => '$baseUrl/news';

  static String getTrendingNews() => '$baseUrl/news/trending';
  static String getNotifications() => '$baseUrl/notifications';
  static String deleteNotificationById(int id) => '$baseUrl/notifications/$id';

  static String getAuthorInfoProfile(int id) =>
      '$baseUrl/user/$id/profile/view';

 static String getNewsByUserId(int id) =>
      '$baseUrl/news/user/$id';

  static String addNewsToFavorites(int id) =>
      '$baseUrl/bookmarks/news/$id/toggle';

  static String getAllBookmarks() =>
      '$baseUrl/bookmarks';
  static String myProfileInfo() =>
      '$baseUrl/auth/account';

  static String createNewPost() =>
      '$baseUrl/news';
  static String getPostInfoById(int postId) =>
      '$baseUrl/news/$postId';
  static String toggleLikePost() =>
      '$baseUrl/like';
static String getNewsByTopicId(int postId) =>
      '$baseUrl/news/topics/$postId';
static String getCommentsByPostId(int postId) =>
      '$baseUrl/comments/$postId';

static String createComment() =>
      '$baseUrl/comments';
static String editComment(int commentId) =>
      '$baseUrl/comments/$commentId';
}
