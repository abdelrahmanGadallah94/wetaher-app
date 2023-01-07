class WeatherModel {
  final DateTime date;
  final String icon;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherState;

  WeatherModel(
      {required this.date,
      required this.icon,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic json){
    dynamic temp = json["forecast"]["forecastday"]["day"];
    return WeatherModel(
        date: json["location"]["localtime"],
        icon: json["current"]["condition"]["icon"],
        avgTemp: temp["avgtemp_c"],
        maxTemp: temp["maxtemp_c"],
        minTemp: temp["mintemp_c"],
        weatherState: json["current"]["condition"]["text"]
    );
  }
}
