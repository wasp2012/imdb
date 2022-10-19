import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_cubit.dart';
import 'package:imdb_demo/business_logic/auth_cubit/authentication_state.dart';
import 'package:imdb_demo/injection.dart';
import 'package:imdb_demo/presentation/widget/plasma.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/helper.dart';
import 'package:imdb_demo/shared/offline_data.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _showPassword = false;

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
              top: 50,
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
                        color: Color(0xfffc5185),
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cubit.userName,
                  validator: (value) => Validator.validateName(value ?? ""),
                  decoration: InputDecoration(
                    isDense: true,
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
                Builder(builder: (context) {
                  return TextFormField(
                    controller: cubit.password,
                    validator: (value) =>
                        Validator.validatePassword(value ?? ""),
                    obscureText: context.watch<LogInCubit>().isPasswordHidden,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: cubit.showHidePassword,
                        child: Icon(cubit.icon),
                      ),
                      hintText: "Password",
                      isDense: true,
                      constraints:
                          const BoxConstraints(maxHeight: 50, minHeight: 20),
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
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child:
                      BlocListener<LogInCubit, AuthenticationState<LoginModel>>(
                    listener: (context, state) {
                      state.whenOrNull(success: (data) {
                        data.success == true
                            ? Navigator.pushReplacementNamed(
                                context, homeScreen)
                            : cantLogInDialog(context);
                      });
                    },
                    child: ElevatedButton(
                      onPressed: () async {
                        await logInOnPress(context, cubit);
                        await getIt<SessionIdCubit>().checkThenCreateSession();
                      },
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logInOnPress(BuildContext context, LogInCubit cubit) async {
    var userName = context.read<LogInCubit>().userName.text;
    var password = context.read<LogInCubit>().password.text;

    if (userName.isNotEmpty && password.isNotEmpty) {
      if (userName.length >= 8 && password.length >= 8) {
        print(userName);
        print(password);
        await cubit.logIn(userName, password);
        // loggedInAlready(cubit, context);
      }
    } else {
      cantLogInDialog(context);
    }
  }

  void loggedInAlready(LogInCubit cubit, BuildContext context) {
    print(cubit.isLoggedIn);
    if (cubit.isLoggedIn == true) {
      Navigator.pushReplacementNamed(context, homeScreen);
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
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}