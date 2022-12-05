import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/auth_cubit/authentication_cubit.dart';
import '../../../shared/helper.dart';
import 'login_button_widget.dart';

class LoginFieldsWidget extends StatelessWidget {
  final Function(BuildContext, AuthenticationCubit) logInOnPress;
  final Function(BuildContext) cantLogInDialog;
  final AuthenticationCubit cubit;
  const LoginFieldsWidget(
      {super.key,
      required this.logInOnPress,
      required this.cantLogInDialog,
      required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          TextFormField(
            controller: cubit.userName,
            validator: (value) => Validator.validateName(value ?? ""),
            decoration: InputDecoration(
              isDense: true,
              constraints: BoxConstraints(maxHeight: 50.h, minHeight: 20.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'Username',
              hintStyle: TextStyle(color: Colors.black54),
              filled: true,
              fillColor: const Color(0xffdee1ec),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Builder(builder: (context) {
            return TextFormField(
              controller: cubit.password,
              validator: (value) => Validator.validatePassword(value ?? ""),
              obscureText:
                  context.watch<AuthenticationCubit>().isPasswordHidden,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: cubit.showHidePassword,
                  child: Icon(cubit.icon),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black54),
                isDense: true,
                constraints: BoxConstraints(maxHeight: 50.h, minHeight: 20.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: Colors.transparent,
                filled: true,
                fillColor: const Color(0xffdee1ec),
              ),
            );
          }),
          LoginButtonWidget(
            cantLogInDialog: (p0) => cantLogInDialog(context),
            cubit: cubit,
            logInOnPress: (p0, p1) => logInOnPress(context, cubit),
          ),
        ],
      ),
    );
  }
}
