import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';
import '../widgets/weather_card.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = WeatherController();
  var weather;
  var isLoading = true;
  var error;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void fetchWeather() async {
    try {
      final result = await controller.getWeatherByLocation();
      setState(() {
        weather = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: isLoading
          ? LoadingWidget()
          : error != null
          ? Center(child: Text(error))
          : WeatherCard(weather: weather),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () => Navigator.pushNamed(context, '/search'),
      ),
    );
  }
}
