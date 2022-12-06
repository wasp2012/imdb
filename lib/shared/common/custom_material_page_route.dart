import 'package:flutter/material.dart';

class CustomMaterialPageRoute<T> extends MaterialPageRoute<T> {
  CustomMaterialPageRoute({
    WidgetBuilder? builder,
    RouteSettings? settings,
  }) : super(
          builder: builder!,
          settings: settings,
        );



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
