import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/data/models/authentication/session_model.dart';
import 'package:imdb_demo/shared/data/repo/auth_repo/auth_repo.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthRepository authRepository;

  AuthenticationCubit(this.authRepository) : super(const Idle());

  RequestTokenModel? requestTokenObj;

  Future<void> emitGetRequestToken() async {
    try {
      emit(const AuthenticationState.loading());

      ApiResult<RequestTokenModel?> response =
          await authRepository.getRequestToken();
      response.when(success: (requestToken) async {
        requestTokenObj = requestToken!;
        await SharedPrefs.addStringToSF(
            requestTokenKey, requestToken.requestToken!);
        emit(AuthenticationState.success(requestToken));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginModel? loginModelObj;
  bool isLoggedIn = false;

  Future<void> logIn(String userName, String password) async {
    print(userName);
    print(password);

    print('Not Empty ${await SharedPrefs.getStringValuesSF(requestTokenKey)}');
    if (await SharedPrefs.checkValue(requestTokenKey)) {
      String reqToken = await SharedPrefs.getStringValuesSF(requestTokenKey);
      await sendDataToLogin(userName, password, reqToken);
    }
  }

  Future<void> sendDataToLogin(
      String userName, String password, String reqToken) async {
    emitPostLogin(LogInBodyModel(
        username: userName, password: password, requestToken: reqToken));
  }

  Future<void> emitPostLogin(LogInBodyModel logInBodyModel) async {
    try {
      emit(const AuthenticationState.loading());

      var response = await authRepository.postLogIn(logInBodyModel);
      response.when(success: (LoginModel? loginResults) async {
        loginModelObj = loginResults;
        await SharedPrefs.addStringToSF(
            userTokenKey, loginResults!.requestToken!);
        isLoggedIn = loginResults.success!;
        emit(AuthenticationState.successLogin(loginResults));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  bool isPasswordHidden = true;
  IconData icon = Icons.visibility_off;

  showHidePassword() {
    isPasswordHidden = !isPasswordHidden;
    icon = isPasswordHidden == true ? Icons.visibility : Icons.visibility_off;
    print(isPasswordHidden);
    emit(AuthenticationState.obscureTextChangeState(icon));
  }

  Future<void> checkThenCreateSession() async {
    if (await SharedPrefs.checkValue(requestTokenKey)) {
      String requestToken =
          await SharedPrefs.getStringValuesSF(requestTokenKey);
      emitSessionId(SessionBody(requestToken: requestToken));
    }
  }

  SessionModel? sessionModel;

  Future<void> emitSessionId(SessionBody sessionBody) async {
    try {
      emit(const AuthenticationState.loading());

      ApiResult<SessionModel?> response =
          await authRepository.createSession(sessionBody);
      response.when(success: (sessionResult) async {
        sessionModel = sessionResult!;
        await SharedPrefs.addStringToSF(sessionIdKey, sessionResult.sessionId!);
        emit(AuthenticationState.success(sessionResult));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
