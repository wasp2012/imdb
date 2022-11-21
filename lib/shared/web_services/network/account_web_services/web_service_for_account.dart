import 'package:dio/dio.dart';
import '../../../constants/apis.dart';
import '../../../data/models/account/profile_details_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../data/models/account/favorite_model.dart';

part 'web_service_for_account.g.dart';

@RestApi(baseUrl: ApisUrl.baseUrl)
abstract class WebServicesForAccount {
  factory WebServicesForAccount(Dio dio, {String baseUrl}) =
      _WebServicesForAccount;

  @GET('/account')
  Future<UserDetailsModel> getUserDetails(
    @Query('api_key') String apiKey,
    @Query('session_id') String sessionId,
  );

  @POST('/account/{account_id}/favorite')
  Future<FavoriteModel> markMovieAsFavorite(
    @Query('api_key') String apiKey,
    @Query('session_id') String sessionId,
    @Path('account_id') int accountId,
    @Body() FavoriteBody favoriteBody,
  );

  @GET('/account/{account_id}/favorite/movies')
  Future<AllFavoriteModel> getFavoriteMovies(
    @Query('api_key') String apiKey,
    @Query('session_id') String sessionId,
    @Path('account_id') int accountId,
  );
}
