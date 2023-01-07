import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/providers/weather_providers.dart';
import 'package:weather_app/views/screens/home_screen.dart';
import 'package:weather_app/views/screens/search_screen.dart';
import 'package:weather_app/views/settings/app_routes.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
    builder: (context, child) => const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherProvider provider = Provider.of<WeatherProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (context) => const HomePage(),
        AppRoutes.searchPage: (context) => const SearchPage(),
      },
      initialRoute: AppRoutes.homePage,
      theme: ThemeData(
          primarySwatch: provider.weatherData == null
              ? Colors.blue
              : provider.weatherData!.changeColor()),
    );
  }
}
