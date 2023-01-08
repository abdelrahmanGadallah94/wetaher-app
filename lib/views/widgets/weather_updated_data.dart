import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/cubit/weather_cubit.dart';
import '../../model/weather_model.dart';

class WeatherUpdatedData extends StatelessWidget {
  const WeatherUpdatedData({
    Key? key,
    required this.data,
  }) : super(key: key);

  final WeatherModel? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 4),
        Text(
          "${Provider.of<WeatherCubit>(context).city}",
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          "Updated at: ${data?.date.hour ?? ''}:${data?.date.minute ?? ''}",
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              "https:${data?.icon ?? ''}",
            ),
            Text(
              "Avg temp: ${data?.avgTemp.toInt() ?? ''} C",
              style: const TextStyle(fontSize: 18),
            ),
            Column(
              children:  [
                Text(
                  "Max temp: ${data?.maxTemp.toInt() ?? ''} C",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Min temp: ${data?.minTemp.toInt() ?? ''} C",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        Text(
          data?.weatherState ?? '',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(flex: 6),
      ],
    );
  }
}
