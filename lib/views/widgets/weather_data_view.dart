import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controller/cubit/weather_cubit.dart';
import 'package:weather_app/views/widgets/weather_updated_data.dart';
import '../../model/weather_model.dart';

class WeatherDataView extends StatelessWidget {
  const WeatherDataView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? data = BlocProvider.of<WeatherCubit>(context).cubitData;
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
      )),
      child: WeatherUpdatedData(data: data),
    );
  }
}
