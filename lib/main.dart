import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controller/cubit/weather_cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/screens/home_screen.dart';
import 'package:weather_app/views/screens/search_screen.dart';
import 'package:weather_app/views/settings/app_routes.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        WeatherModel ?cubit =  BlocProvider.of<WeatherCubit>(context).cubitData;
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              AppRoutes.homePage: (context) => const HomePage(),
              AppRoutes.searchPage: (context) => const SearchPage(),
            },
            initialRoute: AppRoutes.homePage,
            theme: ThemeData(
                primarySwatch:cubit == null
                    ? Colors.blue
                    : cubit.changeColor()));
      },
    );
  }
}
