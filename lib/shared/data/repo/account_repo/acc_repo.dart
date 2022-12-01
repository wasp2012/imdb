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
      print(response!.username);
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
      print('statusMessage ${response!.statusMessage}');
      print('statusCode ${response.statusCode}');
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
      print('statusMessage ${response!.results![0]}');
      print('statusCode ${response}');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
