import 'package:flutter/material.dart';
import 'package:weather_app/views/settings/app_colors.dart';

import '../settings/app_strings.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 33,bottom: 33,left: 10,right: 33),
              suffixIcon: IconButton(
                  onPressed: (){
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
