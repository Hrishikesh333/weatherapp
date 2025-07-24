import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const _apiKey = '96e4f153ce5f7be002ad49c1f83dcf58';
// 👈 Replace with your actual API key
  static const _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=London&appid=your_real_api_key_here&units=metric';

  Future<Weather> fetchWeatherByCity(String city) async {
    final url = '$_baseUrl?q=$city&appid=$_apiKey&units=metric';

    print("🔍 Fetching weather for city: $city");

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("✅ City weather response: ${response.body}");
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      print("❌ City weather error: ${response.statusCode} ${response.body}");
      throw Exception('City not found');
    }
  }

  Future<Weather> fetchWeatherByCoords(double lat, double lon) async {
    final url = '$_baseUrl?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';

    print("🔍 Fetching weather for coordinates: ($lat, $lon)");

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("✅ Coords weather response: ${response.body}");
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      print("❌ Coords weather error: ${response.statusCode} ${response.body}");
      throw Exception('Weather data error');
    }
  }
}
