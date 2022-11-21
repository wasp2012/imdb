// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/data/models/authentication/session_model.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/network/auth_web_services/web_services_for_auth.dart';

abstract class AuthRepositoryInterface {
  Dio? dio = Dio();

  WebServicesForAuth? webServicesForAuth;

  AuthRepositoryInterface() {
    webServicesForAuth =
        WebServicesForAuth(dio!, baseUrl: ApisUrl.baseurlForAuth);
  }

  Future<ApiResult<RequestTokenModel?>> getRequestToken();
  Future<ApiResult<LoginModel?>> postLogIn(LogInBodyModel logInBodyModel);
  Future<ApiResult<SessionModel?>> createSession(SessionBody requestToken);
}
