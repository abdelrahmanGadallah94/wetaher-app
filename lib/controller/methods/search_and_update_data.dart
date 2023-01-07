import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/screens/home_screen.dart';
import '../../views/settings/app_strings.dart';
import '../providers/weather_providers.dart';

Future<void> searchAndUpdateData(BuildContext context, String? city) async {
  WeatherProvider provider =
  Provider.of<WeatherProvider>(context, listen: false);

  await provider.getData(city: city!);
  provider.city = city;
  if(provider.weatherData == null){
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          dismissDirection: DismissDirection.up,
            duration: Duration(seconds: 2),
            content: Text(
            AppStrings.error,
          textAlign: TextAlign.center,
        ))
    );
  }else{
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }
}
