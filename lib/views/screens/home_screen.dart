import 'package:flutter/material.dart';
import 'package:weather_app/views/settings/app_routes.dart';

import '../settings/app_strings.dart';

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
          IconButton(onPressed: (){
            Navigator.pushNamed(context, AppRoutes.searchPage);
          }, icon: const Icon(Icons.search,size: 30,))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(AppStrings.failureSearchMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 27,
              height: 1.4,
              fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
