import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controller/providers/weather_providers.dart';
import 'package:weather_app/views/settings/app_colors.dart';

import '../settings/app_strings.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String ?city;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            AppStrings.appBarSearchTitle,
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            onChanged: (data){
              city = data;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 33,bottom: 33,left: 10,right: 33),
              suffixIcon: IconButton(
                  onPressed: ()async {
                    WeatherProvider provider = Provider.of<WeatherProvider>(context,listen: false);
                    await provider.getData(city: city!);
                    provider.city = city;
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search,size: 30,)),
              hintText: AppStrings.search,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.kMainColor)
              )
            ),
          ),
        ),
      ),
    );
  }
}
