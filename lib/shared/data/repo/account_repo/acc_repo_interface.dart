import 'package:dio/dio.dart';

import '../../../constants/apis.dart';
import '../../../web_services/errors/api_result.dart';
import '../../../web_services/network/account_web_services/web_service_for_account.dart';
import '../../models/account/favorite_model.dart';
import '../../models/account/profile_details_model.dart';

abstract class AccountRepositoryInterface {
  Dio? dio = Dio();

  WebServicesForAccount? webServicesForAcc;

  AccountRepositoryInterface() {
    webServicesForAcc = WebServicesForAccount(dio!, baseUrl: ApisUrl.baseUrl);
  }

  Future<ApiResult<UserDetailsModel?>> getUserDetails(String sessionID);

  Future<ApiResult<FavoriteModel?>> markMovieAsFavorite(
      String sessionId, int accountId, FavoriteBody favoriteBody);

  Future<ApiResult<AllFavoriteModel?>> getFavoriteMovies(
      String sessionId, int accountId);
}
