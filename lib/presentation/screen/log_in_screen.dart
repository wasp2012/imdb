import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/auth_cubit/authentication_cubit.dart';
import '../../business_logic/auth_cubit/authentication_state.dart';
import '../../injection.dart';
import '../widget/plasma.dart';
import '../../shared/constants/strings.dart';
import '../../shared/helper.dart';

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
                        child: Column(
                          children: [
                            TextFormField(
                              controller: cubit.userName,
                              validator: (value) =>
                                  Validator.validateName(value ?? ""),
                              decoration: InputDecoration(
                                isDense: true,
                                constraints: BoxConstraints(
                                    maxHeight: 50.h, minHeight: 20.h),
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
                                validator: (value) =>
                                    Validator.validatePassword(value ?? ""),
                                obscureText: context
                                    .watch<AuthenticationCubit>()
                                    .isPasswordHidden,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: cubit.showHidePassword,
                                    child: Icon(cubit.icon),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  isDense: true,
                                  constraints: BoxConstraints(
                                      maxHeight: 50.h, minHeight: 20.h),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusColor: Colors.transparent,
                                  filled: true,
                                  fillColor: const Color(0xffdee1ec),
                                ),
                              );
                            }),
                            Container(
                              margin: EdgeInsets.only(top: 30.h),
                              alignment: Alignment.center,
                              child: BlocListener<AuthenticationCubit,
                                  AuthenticationState>(
                                listener: (context, state) {
                                  if (state is AuthenticationStateLoading) {
                                    const CircularProgressIndicator();
                                  } else if (state
                                      is AuthenticationStateSuccess) {
                                    cubit.userName.clear();
                                    cubit.password.clear();
                                    Navigator.pushReplacementNamed(
                                        context, homeScreen);
                                  } else if (state
                                      is AuthenticationStateFailed) {
                                    cantLogInDialog(context);
                                  } else if (state
                                      is AuthenticationStateError) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Error Logging in')));
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).buttonColor,
                                      elevation: 10,
                                      alignment: Alignment.center,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                          ),
                                    ),
                                    child: const Text('Log In'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
