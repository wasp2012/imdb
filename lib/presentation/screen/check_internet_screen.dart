import 'package:flutter/material.dart';
import '../../business_logic/theme_cubit/settings_cubit.dart';
import '../../injection.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../shared/common/gradient.dart';

class CheckInternetScreen extends StatefulWidget {
  const CheckInternetScreen({Key? key}) : super(key: key);

  @override
  _CheckInternetScreenState createState() => _CheckInternetScreenState();
}

class _CheckInternetScreenState extends State<CheckInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: SharedGradient.gradientColors(context),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              'No internet connection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
