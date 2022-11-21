// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/offline_data.dart';

class CurvedBottomNavbarWidget extends StatefulWidget {
  final int currentPage;
  const CurvedBottomNavbarWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<CurvedBottomNavbarWidget> createState() =>
      _CurvedBottomNavbarWidgetState();
}

class _CurvedBottomNavbarWidgetState extends State<CurvedBottomNavbarWidget> {
  List<Widget> items = const [
    Icon(
      Icons.home_sharp,
      color: Colors.white,
    ),
    Icon(
      Icons.favorite,
      color: Colors.white,
    ),
    Icon(
      Icons.watch_later_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.account_circle_sharp,
      color: Colors.white,
    ),
    Icon(
      Icons.settings,
      color: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: items,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.purple,
      color: Colors.deepPurple,
      animationDuration: const Duration(microseconds: 300),
      height: 50.h,
      index: widget.currentPage,
      onTap: (index) {
        if (widget.currentPage != index) {
          switchTab(index, context);
        }
      },
    );
  }

  Future<void> switchTab(int index, BuildContext context) async {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, homeScreen);

        break;
      case 1:
        Navigator.pushReplacementNamed(context, favoriteScreen);

        break;
      case 2:
        Navigator.pushReplacementNamed(context, watchListScreen);

        break;
      case 3:
        if (await SharedPrefs.checkValue(sessionIdKey)) {
          Navigator.pushReplacementNamed(context, profileScreen);
        } else {
          await returnToLogin(context);
        }
        break;
      case 4:
        Navigator.pushReplacementNamed(
          context,
          settingsScreen,
        );
        break;
      default:
    }
  }

  Future<void> returnToLogin(BuildContext context) async {
    await SharedPrefs.logOut();
    Navigator.pushReplacementNamed(context, logInScreen);
  }
}

/*




*/