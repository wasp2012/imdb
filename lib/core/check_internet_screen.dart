import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/core/gradient.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckInternetScreen extends StatelessWidget {
  const CheckInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: SharedGradient.gradientColors(context),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 350,
              child: Column(
                children: [
                  Text(
                    'No internet connection',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SvgPicture.asset(
                    'assets/images/no_internet.svg',
                    semanticsLabel: 'No internet connection',
                    height: 150,
                  ),

                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//