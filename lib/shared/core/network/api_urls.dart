abstract class ApiUrls {
  static String baseUrl = 'http://172.104.250.89';
  static String register() => '$baseUrl/api/auth/register';
  static String login() => '$baseUrl/api/auth/login';
}