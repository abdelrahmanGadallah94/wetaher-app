import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/providers/weather_providers.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherDataView extends StatelessWidget {
  const WeatherDataView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? data = Provider.of<WeatherProvider>(context).weatherData;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            data!.changeColor(),
            data.changeColor()[100]!,
            data.changeColor()[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          Text(
            "${Provider.of<WeatherProvider>(context).city}",
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            "Updated at: ${data.date.hour}:${data.date.minute}",
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                "https:${data.icon}",
              ),
               Text(
                "Avg temp: ${data.avgTemp.toInt()} C",
                style: const TextStyle(fontSize: 18),
              ),
              Column(
                children:  [
                  Text(
                    "Max temp: ${data.maxTemp.toInt()} C",
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Min temp: ${data.minTemp.toInt()} C",
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
           Text(
            data.weatherState,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
