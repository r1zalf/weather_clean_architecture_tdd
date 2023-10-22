class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '64218de1f443ec162a803b56a990e259';
  static Uri currentWeatherByName(String city) =>
      Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey');
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
