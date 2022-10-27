import 'package:dio/dio.dart';
import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/account/favorite_model.dart';
import 'package:imdb_demo/shared/data/models/account/profile_details_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/network/account_web_services/web_service_for_account.dart';

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
