import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../shared/constants/strings.dart';
import '../../shared/data/models/authentication/login_model.dart';
import '../../shared/data/models/authentication/req_token.dart';
import '../../shared/data/models/authentication/session_model.dart';
import '../../shared/data/repo/auth_repo/auth_repo.dart';
import '../../shared/offline_data.dart';
import '../../shared/web_services/errors/api_result.dart';
import '../../shared/web_services/errors/network_exceptions.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthRepository authRepository;

  AuthenticationCubit(this.authRepository) : super(AuthenticationStateIdle());

  RequestTokenModel? requestTokenObj;

  Future<void> emitGetRequestToken() async {
    emit(AuthenticationStateLoading());

    try {
      ApiResult<RequestTokenModel?> response =
          await authRepository.getRequestToken();
      response.when(success: (requestToken) async {
        requestTokenObj = requestToken!;
        await SharedPrefs.addStringToSF(
            requestTokenKey, requestToken.requestToken!);
        emit(AuthenticationStateReqTokenSuccess(requestToken));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationStateError(networkExceptions));
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
    print('Not Empty ${await SharedPrefs.getStringValuesSF(requestTokenKey)}');
    if (await SharedPrefs.checkValue(requestTokenKey)) {
      String reqToken = await SharedPrefs.getStringValuesSF(requestTokenKey);
      await emitPostLogin(LogInBodyModel(
          username: userName, password: password, requestToken: reqToken));
    } else {
      emitGetRequestToken();
      String reqToken = await SharedPrefs.getStringValuesSF(requestTokenKey);
      await emitPostLogin(LogInBodyModel(
          username: userName, password: password, requestToken: reqToken));
    }
  }

  Future<void> emitPostLogin(LogInBodyModel logInBodyModel) async {
    emit(AuthenticationStateLoading());

    try {
      var response = await authRepository.postLogIn(logInBodyModel);
      response.when(success: (LoginModel? loginResults) async {
        loginModelObj = loginResults;

        if (loginModelObj?.success == true) {
          await SharedPrefs.addStringToSF(
              userTokenKey, loginResults!.requestToken!);

          isLoggedIn = loginResults.success!;

          checkThenCreateSession();

          emit(AuthenticationStateSuccess(loginResults));
        } else {
          emit(AuthenticationStateFailed());
        }
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationStateError(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  bool isPasswordHidden = true;
  IconData icon = Icons.visibility_off;

  void showHidePassword() {
    isPasswordHidden = !isPasswordHidden;
    icon = isPasswordHidden == true ? Icons.visibility : Icons.visibility_off;
    print(isPasswordHidden);
    emit(AuthenticationStateChangeText(icon));
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
    emit(AuthenticationStateLoading());
    try {
      ApiResult<SessionModel?> response =
          await authRepository.createSession(sessionBody);
      response.when(success: (sessionResult) async {
        sessionModel = sessionResult!;
        await SharedPrefs.addStringToSF(sessionIdKey, sessionResult.sessionId!);
        emit(AuthenticationStateSessionModelSuccess(sessionResult));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationStateError(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
