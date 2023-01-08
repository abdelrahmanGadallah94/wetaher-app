import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/controller/cubit/weather_cubit.dart';
import '../settings/app_strings.dart';
import '../widgets/custom_text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          AppStrings.appBarSearchTitle,
        ),
      ),
      body: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
           if(state is WeatherSuccess){
          Navigator.pop(context);
          }
           else if(state is WeatherFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.error,textAlign: TextAlign.center,))
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: CustomTextField(context: context)
          ),
        ),
      ),
    );
  }
}
