import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
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
        await favoriteMovieResponse(sessionId, userId, favoriteBody);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('Session ID Not found or User ID');
    }
  }

  Future<void> favoriteMovieResponse(
      String sessionId, int userId, FavoriteBody favoriteBody) async {
    ApiResult<FavoriteModel?> response = await accountRepository
        .markMovieAsFavorite(sessionId, userId, favoriteBody);
    response.when(success: (favoriteResult) async {
      favoriteModel = favoriteResult!;
      await isSaved(
        favoriteResult.statusCode ?? 0,
        favoriteBody.mediaId ?? 0,
        favoriteResult,
      );
    }, failure: (NetworkExceptions networkExceptions) {
      emit(FavoriteStateError(networkExceptions));
    });
  }

  Future<void> isSaved(
    int statusCode,
    int mediaId,
    FavoriteModel favoriteModel,
  ) async {
    switch (statusCode) {
      case 1:
        await emitGetFavoriteMovies();
        checkIfMovieExist(mediaId);
        emit(FavoriteStateSaved(favoriteModel: favoriteModel));
        break;
      case 13:
        await emitGetFavoriteMovies();
        checkIfMovieExist(mediaId);
        emit(FavoriteStateRemoved(favoriteModel: favoriteModel));
        break;
      case 12:
        checkIfMovieExist(mediaId);
        break;

      default:
    }
  }

  AllFavoriteModel allFavoriteModel = AllFavoriteModel();
  List<Results>? favoriteMoviesList = [];
  Future<void> emitGetFavoriteMovies() async {
    if (await SharedPrefs.checkValue(sessionIdKey) &&
        await SharedPrefs.checkValue(userIdKey)) {
      var sessionId = await SharedPrefs.getStringValuesSF(sessionIdKey);
      var userId = await SharedPrefs.getIntValuesSF(userIdKey);

      ApiResult<AllFavoriteModel?> response =
          await accountRepository.getFavoriteMovies(sessionId, userId);
      response.when(success: (favoriteMoviesResponse) {
        allFavoriteModel = favoriteMoviesResponse!;
        favoriteMoviesList = favoriteMoviesResponse.results;
        print(favoriteMoviesList);
        emit(FavoriteMoviesSuccess(favoriteMoviesResponse));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(FavoriteMoviesError(networkExceptions));
      });
    } else {
      throw const NetworkExceptions.notFound('Session ID Or UserId');
    }
  }

  bool isFavorite = false;
  IconData? iconData;
  bool? isExist;
  void checkIfMovieExist(int id) {
    isExist = favoriteMoviesList!.map((item) => item.id).contains(id);
    print(isExist);
    if (isExist!) {
      iconData = Icons.favorite;
      isFavorite = true;
    } else {
      iconData = Icons.favorite_border;
      isFavorite = false;
    }
  }
}
