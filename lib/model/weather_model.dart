import 'package:flutter/material.dart';

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
    dynamic temp = json["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date: DateTime.parse(json["location"]["localtime"]),
        icon: temp["condition"]["icon"],
        avgTemp: temp["avgtemp_c"],
        maxTemp: temp["maxtemp_c"],
        minTemp: temp["mintemp_c"],
        weatherState: temp["condition"]["text"]
    );
  }

  MaterialColor changeColor(){
    if(weatherState == "Partly cloudy" || weatherState == "Cloudy"){
      return Colors.deepPurple;
    }else if(weatherState == "Patchy rain possible" ||weatherState == "Light rain shower"){
      return Colors.cyan;
    }else if(weatherState == "Clear"){
      return Colors.yellow;
    }else if(weatherState == "Light rain shower"){
      return Colors.orange;
    }else if(weatherState == "Moderate rain"){
      return Colors.green;
    }
    else{
      return Colors.blue;
    }
  }
}
