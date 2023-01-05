import 'package:flutter/material.dart';
import 'package:weather_app/views/screens/home_screen.dart';
import 'package:weather_app/views/screens/search_screen.dart';
import 'package:weather_app/views/settings/app_routes.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (context) => const HomePage(),
        AppRoutes.searchPage: (context) => const SearchPage(),
      },
      initialRoute: AppRoutes.homePage,

    );
  }
}

