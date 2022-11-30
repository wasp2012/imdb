import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../constants/apis.dart';
import '../../../data/models/authentication/login_model.dart';
import '../../../data/models/authentication/req_token.dart';
import '../../../data/models/authentication/session_model.dart';

part 'web_services_for_auth.g.dart';

@RestApi(baseUrl: ApisUrl.baseurlForAuth)
abstract class WebServicesForAuth {
  factory WebServicesForAuth(Dio dio, {String baseUrl}) = _WebServicesForAuth;

  @GET('/token/new')
  Future<RequestTokenModel> getRequestToken(
    @Query('api_key') String apiKey,
  );

  @POST('/token/validate_with_login')
  Future<LoginModel> postLogIn(
    @Query('api_key') String apiKey,
    @Body() LogInBodyModel bodyModel,
  );
  @POST('/session/new')
  Future<SessionModel> createSession(
    @Query('api_key') String apiKey,
    @Body() SessionBody requestToken,
  );
}
