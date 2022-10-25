import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/account/favorite_model.dart';
import 'package:imdb_demo/shared/data/models/account/profile_details_model.dart';
import 'package:imdb_demo/shared/data/models/authentication/login_model.dart';
import 'package:imdb_demo/shared/data/repo/account_repo/acc_repo_interface.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

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
}
