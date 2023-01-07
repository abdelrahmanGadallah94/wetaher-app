import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../model/weather_model.dart';
import 'package:http/http.dart' as http;

import '../../views/settings/app_strings.dart';
part 'weather_state.dart';
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  WeatherModel ? weatherData;
  String ?city;

  Future<WeatherModel?> getData({required String city}) async {
    emit(WeatherLoading());
    try {
      http.Response response = await http.get(Uri.parse(
          "${AppStrings.baseUrl}/forecast.json?key=${AppStrings.kApiKey}&q=$city&days=7"));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        weatherData = WeatherModel.fromJson(body);
        emit(WeatherSuccess());
        return weatherData;
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(WeatherFailure());
    }
    return null;
  }
}
