import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData
                ?.getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
