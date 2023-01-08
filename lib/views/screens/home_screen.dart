import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controller/cubit/weather_cubit.dart';
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
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if(state is WeatherLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is WeatherSuccess){
            return const WeatherDataView();
          }else{
            return const WarningData();
          }
        },
      )
    );
  }
}
