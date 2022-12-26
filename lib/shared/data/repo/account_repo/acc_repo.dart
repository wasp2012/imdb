import 'package:imdb_demo/shared/data/models/account/get_watchlist_model.dart';
import 'package:imdb_demo/shared/data/models/account/watchlist_model.dart';

import '../../../constants/apis.dart';
import '../../../web_services/errors/api_result.dart';
import '../../../web_services/errors/network_exceptions.dart';
import '../../models/account/favorite_model.dart';
import '../../models/account/profile_details_model.dart';
import 'acc_repo_interface.dart';

class AccountRepository extends AccountRepositoryInterface {
  @override
  Future<ApiResult<UserDetailsModel?>> getUserDetails(String sessionID) async {
    try {
      var response =
          await webServicesForAcc?.getUserDetails(ApisUrl.apiKey, sessionID);
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
  Future<ApiResult<FavoriteModel?>> markMovieAsFavorite(
      String sessionId, int accountId, FavoriteBody favoriteBody) async {
    try {
      var response = await webServicesForAcc?.markMovieAsFavorite(
          ApisUrl.apiKey, sessionId, accountId, favoriteBody);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<AllFavoriteModel?>> getFavoriteMovies(
      String sessionId, int accountId) async {
    try {
      var response = await webServicesForAcc?.getFavoriteMovies(
          ApisUrl.apiKey, sessionId, accountId);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<WatchListModel?>> addToWatchList(
      String sessionId, int accountId, WatchListBody watchListBody) async {
    try {
      var response = await webServicesForAcc?.addToWatchList(
          ApisUrl.apiKey, sessionId, accountId, watchListBody);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<WatchListResultModel?>> getWatchListMovies(
      String sessionId, int accountId) async {
    try {
      var response = await webServicesForAcc?.getWatchListMovies(
          ApisUrl.apiKey, sessionId, accountId);
      print('statusMessage ${response!.results![0]}');
      print('statusCode ${response}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
