import 'package:dio/dio.dart';
import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/req_token.dart';
import 'package:retrofit/retrofit.dart';

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
}
