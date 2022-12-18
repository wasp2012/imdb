import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/auth_cubit/authentication_cubit.dart';
import '../../../shared/helper.dart';
import 'login_button_widget.dart';

class LoginFieldsWidget extends StatefulWidget {
  final Function(BuildContext, AuthenticationCubit) logInOnPress;
  final Function(BuildContext) cantLogInDialog;
  final AuthenticationCubit cubit;
  const LoginFieldsWidget(
      {super.key,
      required this.logInOnPress,
      required this.cantLogInDialog,
      required this.cubit});

  @override
  State<LoginFieldsWidget> createState() => _LoginFieldsWidgetState();
}

class _LoginFieldsWidgetState extends State<LoginFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: widget.cubit.userName,
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
            height: 10.h,
          ),
          Builder(builder: (context) {
            return TextFormField(
              controller: widget.cubit.password,
              validator: (value) => Validator.validatePassword(value ?? ""),
              obscureText:
                  context.watch<AuthenticationCubit>().isPasswordHidden,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: widget.cubit.showHidePassword,
                  child: Icon(widget.cubit.icon),
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
            cantLogInDialog: (p0) => widget.cantLogInDialog(context),
            cubit: widget.cubit,
            logInOnPress: (p0, p1) =>
                widget.logInOnPress(context, widget.cubit),
          ),
        ],
      ),
    );
  }
}
