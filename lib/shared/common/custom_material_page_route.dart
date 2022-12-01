import 'package:flutter/material.dart';

class CustomMaterialPageRoute<T> extends MaterialPageRoute<T> {
  CustomMaterialPageRoute({
    WidgetBuilder? builder,
    RouteSettings? settings,
  }) : super(
          builder: builder!,
          settings: settings,
        );

  // List<Alignment> randomTransitions = [
  //   Alignment.bottomCenter,
  //   Alignment.bottomLeft,
  //   Alignment.bottomRight,
  //   Alignment.center,
  //   Alignment.centerLeft,
  //   Alignment.centerRight,
  //   Alignment.topCenter,
  //   Alignment.topLeft,
  //   Alignment.topRight,
  // ];

  // Alignment randomAlignment() {
  //   var randomAlignment = Random();
  //   int randomIndex = randomAlignment.nextInt(randomTransitions.length - 1);
  //   return randomTransitions[randomIndex];
  // }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
