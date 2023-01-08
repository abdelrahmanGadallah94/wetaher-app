import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cubit/weather_cubit.dart';
import '../settings/app_colors.dart';
import '../settings/app_strings.dart';

class CustomTextField extends StatelessWidget {
  final BuildContext context;
  const CustomTextField({Key? key,required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? city;
    return TextField(
      onChanged: (data) {
        city = data;
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
              top: 33, bottom: 33, left: 10, right: 33),
          suffixIcon: IconButton(
              onPressed: () async {
                // await searchAndUpdateData(context, city);
                WeatherCubit cubit = BlocProvider.of<WeatherCubit>(
                    context);
                cubit.cubitData = await cubit.getData(city: city?? '');
                cubit.city = city;
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          hintText: AppStrings.search,
          border: const OutlineInputBorder(),
          focusedBorder:  const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kMainColor))),
    );
  }
}
