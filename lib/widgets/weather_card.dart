import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          'http://openweathermap.org/img/wn/${weather.iconCode}@2x.png',
        ),
        title: Text('${weather.cityName}'),
        subtitle: Text('${weather.condition} - ${weather.temperature}°C'),
      ),
    );
  }
}
