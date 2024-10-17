abstract class ApiUrls {
  static String baseUrl = 'http://172.104.250.89';
  static String register() => '$baseUrl/api/auth/register';
  static String login() => '$baseUrl/api/auth/login';
  static String getCountries() => '$baseUrl/api/search/countries';
  static String getTopicsBySearch() => '$baseUrl/api/search/topics';
  static String getTopics() => '$baseUrl/api/topics';
  static String searchInNewSources() => '$baseUrl/api/search/authors';
  static String checkFollowing(int id) => '$baseUrl/api/follow/$id';
  static String follow(int id) => '$baseUrl/api/follow/$id';
  static String createYourProfile() => '$baseUrl/api/user/profile/create';
  static String yourFollowing() => '$baseUrl/api/following';
  static String logout() => '$baseUrl/api/auth/logout';
  static String getAllNews() => '$baseUrl/api/news';
  static String getTrendingNews() => '$baseUrl/api/news/trending';
  static String getAuthorInfoProfile(int id) => '$baseUrl/api/user/$id/profile/view';

}