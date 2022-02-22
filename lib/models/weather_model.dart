class WeatherModel {
  String weatherStateName;
  String date;
  double temp;
  double minTemp;
  double maxTemp;

  WeatherModel(
      {required this.weatherStateName,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp});

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      weatherStateName: data['weather_state_name'],
      date: data['applicable_date'],
      temp: data['the_temp'],
      minTemp: data['min_temp'],
      maxTemp: data['max_temp'],
    );
  }
}
