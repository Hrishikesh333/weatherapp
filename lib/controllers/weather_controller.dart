import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class WeatherController {
  final _weatherService = WeatherService();
  final _locationService = LocationService();

  Future<Weather> getWeatherByCity(String city) async {
    return await _weatherService.fetchWeatherByCity(city);
  }

  Future<Weather> getWeatherByLocation() async {
    final position = await _locationService.getCurrentLocation();
    return await _weatherService.fetchWeatherByCoords(position.latitude, position.longitude);
  }
}
