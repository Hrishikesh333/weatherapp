import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';
import '../widgets/weather_card.dart';
import '../widgets/loading_widget.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = WeatherController();
  final searchController = TextEditingController();
  var weather;
  var isLoading = false;
  var error;

  void searchWeather() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final result = await controller.getWeatherByCity(searchController.text);
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
      appBar: AppBar(title: Text('Search City')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: searchWeather,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (isLoading)
              LoadingWidget()
            else if (error != null)
              Text(error!, style: TextStyle(color: Colors.red))
            else if (weather != null)
                WeatherCard(weather: weather)
          ],
        ),
      ),
    );
  }
}
