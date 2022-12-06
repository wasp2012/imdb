import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../business_logic/auth_cubit/authentication_cubit.dart';
import '../../../business_logic/auth_cubit/authentication_state.dart';
import '../../../shared/constants/strings.dart';

class LoginButtonWidget extends StatefulWidget {
  final Function(BuildContext, AuthenticationCubit) logInOnPress;
  final Function(BuildContext) cantLogInDialog;
  final AuthenticationCubit cubit;
  const LoginButtonWidget(
      {super.key,
      required this.logInOnPress,
      required this.cantLogInDialog,
      required this.cubit});

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Row(
        children: [
          BlocListener<AuthenticationCubit, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationStateLoading) {
                const CircularProgressIndicator();
              } else if (state is AuthenticationStateSuccess) {
                widget.cubit.userName.clear();
                widget.cubit.password.clear();
                Navigator.pushReplacementNamed(context, homeScreen);
              } else if (state is AuthenticationStateFailed) {
                widget.cantLogInDialog(context);
              } else if (state is AuthenticationStateError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Error Logging in')));
              }
            },
            child: SizedBox(
              height: 40.h,
              width: 150.w,
              child: ElevatedButton(
                onPressed: () async {
                  await widget.logInOnPress(context, widget.cubit);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Theme.of(context).buttonColor,
                  elevation: 10,
                  alignment: Alignment.center,
                  textStyle: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                ),
                child: const Text('Log In'),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
            width: 150.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  signUpWebViewScreen,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                // backgroundColor: Colors.white,
                alignment: Alignment.center,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              child: const Text('SignUp'),
            ),
          ),
        ],
      ),
    );
  }
}
