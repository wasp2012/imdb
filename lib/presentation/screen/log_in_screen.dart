import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/presentation/widget/plasma.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/offline_data.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    super.initState();
    getIt<RequestTokenCubit>().emitGetRequestToken();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<LogInCubit>();
    return Scaffold(
      body: Stack(
        children: [
          const PlasmaBackground(),
          Positioned(
              left: 30,
              right: 30,
              child: Image.asset(
                alignment: Alignment.center,
                'assets/images/popcorn.png',
                height: 300,
                width: 300,
              )),
          Positioned(
            bottom: 30,
            right: 30,
            left: 30,
            top: 370,
            child: Column(
              children: [
                Text(
                  'Log In Now',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please enter the details below to continue',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: context.read<LogInCubit>().userName,
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxHeight: 50, minHeight: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Username',
                    filled: true,
                    fillColor: const Color(0xffdee1ec),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: context.read<LogInCubit>().password,
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxHeight: 50, minHeight: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Password',
                    focusColor: Colors.transparent,
                    filled: true,
                    fillColor: const Color(0xffdee1ec),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: (cubit.userName!.text.length >= 8 &&
                            cubit.password!.text.length >= 8)
                        ? null
                        : () => LogInOnPress(context, cubit),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Theme.of(context).buttonColor,
                      elevation: 10,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          left: 160, right: 160, top: 15, bottom: 15),
                      textStyle:
                          Theme.of(context).textTheme.headline1!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                    ),
                    child: const Text('Log In'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void LogInOnPress(BuildContext context, LogInCubit cubit) {
    var userName = context.read<LogInCubit>().userName!.text;
    var password = context.read<LogInCubit>().password!.text;

    if ((userName.isNotEmpty && userName != null) &&
        (password.isNotEmpty && password != null)) {
      cubit.logIn();
      if (cubit.loginModelObj!.success == true) {
        Navigator.pushReplacementNamed(context, homeScreen);
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Log in Failed"),
            content: const Text("Enter a valid data"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Ok'),
              ),
            ],
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Log in Failed"),
          content: const Text("Enter a valid data"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
}
