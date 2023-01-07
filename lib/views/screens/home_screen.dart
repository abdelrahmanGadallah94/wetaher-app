import 'package:flutter/material.dart';
import 'package:weather_app/views/settings/app_routes.dart';

import '../settings/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = false;
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
      body: check == false?
          Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 4),
                  const Text("Cairo",style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),),
                  const Spacer(),
                  const Text("Updated at: 12:00 pm",style: TextStyle(
                    fontSize: 18
                  ),),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Temp",style: TextStyle(fontSize: 18),),
                      const Text("avg temp",style: TextStyle(fontSize: 18),),
                      Column(
                        children: const [
                          Text("Max temp: ",style: TextStyle(fontSize: 18),),
                          Text("Min temp: ",style: TextStyle(fontSize: 18),),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  const Text("Weather State",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold
                  ),),
                  const Spacer(flex: 6),
                ],
              ),
            )
          : const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  AppStrings.failureSearchMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27, height: 1.4, fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
