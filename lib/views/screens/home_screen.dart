import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/providers/weather_providers.dart';
import 'package:weather_app/views/settings/app_routes.dart';

import '../settings/app_strings.dart';
import '../widgets/warning_data_view.dart';
import '../widgets/weather_data_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appBarTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.searchPage);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = null;
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData != null
          ? const WeatherDataView()
          : const WarningData(),
    );
  }
}
