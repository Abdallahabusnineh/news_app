abstract class ApiUrls {
  static String baseUrl = 'http://172.104.250.89';
  static String register() => '$baseUrl/api/auth/register';
  static String login() => '$baseUrl/api/auth/login';
  static String getCountries() => '$baseUrl/api/search/countries';
  static String getTopics() => '$baseUrl/api/search/topics';
  static String searchInNewSources() => '$baseUrl/api/search/authors';
  static String checkFollowing(int id) => '$baseUrl/api/follow/$id';
  static String follow(int id) => '$baseUrl/api/follow/$id';
  static String createYourProfile() => '$baseUrl/api/user/profile/create';
  static String yourFollowing() => '$baseUrl/api/following';
  static String logout() => '$baseUrl/api/auth/logout';

}