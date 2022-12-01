import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/auth_cubit/authentication_cubit.dart';
import '../../injection.dart';
import '../widget/login/login_fields_widget.dart';
import '../widget/plasma.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = getIt<AuthenticationCubit>();
    return FutureBuilder(
        future: cubit.emitGetRequestToken(),
        builder: (context, snapshot) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                const PlasmaBackground(),
                Positioned(
                    left: 30.w,
                    right: 30.w,
                    top: 20.h,
                    child: Image.asset(
                      alignment: Alignment.center,
                      'assets/images/popcorn.png',
                      height: 300.h,
                      width: 270.w,
                    )),
                Positioned(
                  bottom: 30.h,
                  right: 30.w,
                  left: 30.w,
                  top: 300.h,
                  child: Column(
                    children: [
                      Text(
                        'Log In Now',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Please enter the details below to continue',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Color.fromARGB(255, 46, 32, 36),
                            ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SingleChildScrollView(
                        child: LoginFieldsWidget(
                            cantLogInDialog: (p0) => cantLogInDialog(context),
                            cubit: cubit,
                            logInOnPress: (p0, p1) =>
                                logInOnPress(context, cubit)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> logInOnPress(
      BuildContext context, AuthenticationCubit cubit) async {
    var userName = context.read<AuthenticationCubit>().userName.text;
    var password = context.read<AuthenticationCubit>().password.text;

    if (userName.isNotEmpty && password.isNotEmpty) {
      if (userName.length >= 8 && password.length >= 8) {
        await cubit.logIn(userName, password);
        // loggedInAlready(cubit, context);
      }
    } else {
      cantLogInDialog(context);
    }
  }

  void cantLogInDialog(BuildContext context) {
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
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
