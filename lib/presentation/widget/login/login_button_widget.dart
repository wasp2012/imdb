import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/auth_cubit/authentication_cubit.dart';
import '../../../business_logic/auth_cubit/authentication_state.dart';
import '../../../shared/constants/strings.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function(BuildContext, AuthenticationCubit) logInOnPress;
  final Function(BuildContext) cantLogInDialog;
  final AuthenticationCubit cubit;
  const LoginButtonWidget(
      {super.key,
      required this.logInOnPress,
      required this.cantLogInDialog,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      alignment: Alignment.center,
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationStateLoading) {
            const CircularProgressIndicator();
          } else if (state is AuthenticationStateSuccess) {
            cubit.userName.clear();
            cubit.password.clear();
            Navigator.pushReplacementNamed(context, homeScreen);
          } else if (state is AuthenticationStateFailed) {
            cantLogInDialog(context);
          } else if (state is AuthenticationStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error Logging in')));
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 10.h),
          height: 40.h,
          width: 300.w,
          child: ElevatedButton(
            onPressed: () async {
              await logInOnPress(context, cubit);
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
    );
  }
}
