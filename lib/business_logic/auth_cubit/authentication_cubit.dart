import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/data/repo/auth_repo/auth_repo.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import 'authentication_state.dart';

class RequestTokenCubit extends Cubit<AuthenticationState<RequestTokenModel>> {
  AuthRepository authRepository;

  RequestTokenCubit(this.authRepository) : super(const Idle());

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
}

class LogInCubit extends Cubit<AuthenticationState<LoginModel>> {
  AuthRepository authRepository;

  TextEditingController? userName = TextEditingController();
  TextEditingController? password = TextEditingController();

  LogInCubit(this.authRepository) : super(const Idle());
  LoginModel? loginModelObj;

  Future<void> emitPostLogin(LogInBodyModel logInBodyModel) async {
    try {
      emit(const AuthenticationState.loading());

      ApiResult<LoginModel?> response =
          await authRepository.postLogIn(logInBodyModel);
      response.when(success: (loginResults) async {
        loginModelObj = loginResults!;
        await SharedPrefs.addStringToSF(userToken, loginResults.requestToken!);
        emit(AuthenticationState.success(loginResults));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(AuthenticationState.error(networkExceptions));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  logIn() async {
    if (userName!.text.isNotEmpty && password!.text.isNotEmpty) {
      String reqToken = await SharedPrefs.getStringValuesSF(requestTokenKey);
      if (reqToken != '' && reqToken.isNotEmpty) {
        emitPostLogin(LogInBodyModel(
            username: userName?.text,
            password: password?.text,
            requestToken: reqToken));
      }
    }
  }
}
