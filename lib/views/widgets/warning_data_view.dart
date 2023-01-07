import 'package:flutter/material.dart';

import '../settings/app_strings.dart';

class WarningData extends StatelessWidget {
  const WarningData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Text(
          AppStrings.failureSearchMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 27, height: 1.4, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
