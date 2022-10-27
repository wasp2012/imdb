import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/account/favorite_model.dart';
import 'package:imdb_demo/shared/data/repo/account_repo/acc_repo.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/account/profile_details_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  AccountRepository accountRepository;

  FavoriteCubit(
    this.accountRepository,
  ) : super(FavoriteStateIdle());

  FavoriteModel? favoriteModel;

  Future<void> emitMarkAsFavorite(FavoriteBody favoriteBody) async {
    emit(FavoriteStateLoading());

    if (await SharedPrefs.checkValue(sessionIdKey) &&
        await SharedPrefs.checkValue(userIdKey)) {
      String sessionId = await SharedPrefs.getStringValuesSF(sessionIdKey);
      int userId = await SharedPrefs.getIntValuesSF(userIdKey);
      try {
        ApiResult<FavoriteModel?> response = await accountRepository
            .markMovieAsFavorite(sessionId, userId, favoriteBody);
        response.when(success: (favoriteResult) {
          favoriteModel = favoriteResult!;
          if (favoriteResult.statusCode == 12) {
            saveFavorite();
            emit(FavoriteStateSaved(favoriteModel: favoriteResult));
          } else if (favoriteResult.statusCode == 13) {
            saveFavorite();
            emit(FavoriteStateRemoved(favoriteModel: favoriteResult));
          }
        }, failure: (NetworkExceptions networkExceptions) {
          emit(FavoriteStateError(networkExceptions));
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('Session ID Not found or User ID');
    }
  }

  bool isFavorite = false;

  Future<void> saveFavorite() async {
    isFavorite = !isFavorite;
    await SharedPrefs.addBoolToSF(favoriteKey, isFavorite);
  }
}
