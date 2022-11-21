import 'dart:convert';

import '../../../constants/apis.dart';
import '../../models/authentication/login_model.dart';
import '../../models/authentication/req_token.dart';
import '../../models/authentication/session_model.dart';
import 'auth_repo_interface.dart';
import '../../../web_services/errors/api_result.dart';
import '../../../web_services/errors/network_exceptions.dart';

class AuthRepository extends AuthRepositoryInterface {
  @override
  Future<ApiResult<RequestTokenModel>> getRequestToken() async {
    try {
      var response = await webServicesForAuth?.getRequestToken(ApisUrl.apiKey);
      // print('response API token ${jsonEncode(response!.requestToken)}');
      return ApiResult.success(response!);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<LoginModel?>> postLogIn(
      LogInBodyModel logInBodyModel) async {
    print('LOg In');
    try {
      var response =
          await webServicesForAuth?.postLogIn(ApisUrl.apiKey, logInBodyModel);
      print('response API token ${jsonEncode(response!.success)}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }

  @override
  Future<ApiResult<SessionModel?>> createSession(
      SessionBody requestToken) async {
    print('Session success ');

    try {
      var response =
          await webServicesForAuth?.createSession(ApisUrl.apiKey, requestToken);
      print('Session success ${response!.success}');
      print('Session ID ${response.sessionId}');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(
          error,
        ),
      );
    }
  }
}
