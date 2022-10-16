import 'dart:convert';

import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:imdb_demo/shared/data/repo/auth_repo/auth_repo_interface.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

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
    try {
      var response =
          await webServicesForAuth?.postLogIn(ApisUrl.apiKey, logInBodyModel);
      // print('response API token ${jsonEncode(response!.expiresAt)}');
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
