import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/views/settings/app_strings.dart';
import '../../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherData;
  bool dataCheck = true;
  String? city;
  Future<WeatherModel?> getData({required String city}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "${AppStrings.baseUrl}/forecast.json?key=${AppStrings.kApiKey}&q=$city&days=7"));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        weatherData = WeatherModel.fromJson(body);
        notifyListeners();
        return weatherData;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
