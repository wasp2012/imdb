import 'package:imdb_demo/shared/constants/apis.dart';
import 'package:imdb_demo/shared/data/models/account/profile_details_model.dart';
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
}
