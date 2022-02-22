import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Center(
        child: TextField(
          // onSubmitted: (data) async {
          //   cityName = data;
          //   WeatherService service = WeatherService();

          //   WeatherModel weather =
          //       await service.getWeather(cityName: cityName!);
          //   print(weather.temp);
          // },
          onChanged: (data) {
            cityName = data;
          },
          onSubmitted: (data) async {
            cityName = data;

            WeatherService service = WeatherService();

            WeatherModel? weather =
                await service.getWeather(cityName: cityName!);
            print('xxxxxxxxxxxxx ${weather.maxTemp}');

            Provider.of<WeatherProvider>(context, listen: false).weatherData =
                weather;
            //              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

            Navigator.pop(context);
          },
          decoration: InputDecoration(
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Ecter a City'),
        ),
      ),
    );
  }
}
