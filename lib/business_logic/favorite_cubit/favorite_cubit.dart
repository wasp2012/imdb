import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
        response.when(success: (favoriteResult) async {
          favoriteModel = favoriteResult!;
          if (favoriteResult.statusCode == 1) {
            await emitGetFavoriteMovies();
            checkIfFavorite(favoriteBody.mediaId ?? 0);
            emit(FavoriteStateSaved(favoriteModel: favoriteResult));
          } else if (favoriteResult.statusCode == 13) {
            await emitGetFavoriteMovies();
            checkIfFavorite(favoriteBody.mediaId ?? 0);

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

  AllFavoriteModel allFavoriteModel = AllFavoriteModel();
  List<Results>? favoriteMoviesList = [];
  Future<void> emitGetFavoriteMovies() async {
    emit(FavoriteMoviesLoading());
    if (await SharedPrefs.checkValue(sessionIdKey) &&
        await SharedPrefs.checkValue(userIdKey)) {
      var sessionId = await SharedPrefs.getStringValuesSF(sessionIdKey);
      var userId = await SharedPrefs.getIntValuesSF(userIdKey);

      ApiResult<AllFavoriteModel?> response =
          await accountRepository.getFavoriteMovies(sessionId, userId);
      response.when(success: (favoriteMoviesResponse) {
        allFavoriteModel = favoriteMoviesResponse!;
        favoriteMoviesList = favoriteMoviesResponse.results;
        emit(FavoriteMoviesSuccess(favoriteMoviesResponse));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(FavoriteMoviesError(networkExceptions));
      });
    } else {
      throw const NetworkExceptions.notFound('Session ID Or UserId');
    }
  }

  bool isFavorite = false;

// allFavoriteModel.results!.where((element) => element.id == int.parse(id))
  void checkIfFavorite(int id) {
    var flag = favoriteMoviesList!.where((element) => element.id == id);
    if (flag.isNotEmpty) {
      isFavorite = true;
      emit(MarkFavoriteIcon(iconData: Icons.favorite));
    } else {
      emit(MarkFavoriteIcon(iconData: Icons.favorite_border));
      isFavorite = false;
    }
  }
}