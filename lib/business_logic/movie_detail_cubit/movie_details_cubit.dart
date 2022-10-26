// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/account/favorite_model.dart';

import 'package:imdb_demo/shared/data/repo/account_repo/acc_repo.dart';
import 'package:imdb_demo/shared/data/repo/movies_repo/movies_repository.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import '../../shared/data/models/account/profile_details_model.dart';
import '../../shared/data/models/movies/movie_details.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MoviesRepository moviesRepository;
  AccountRepository accountRepository;

  MovieDetailsCubit(
    this.moviesRepository,
    this.accountRepository,
  ) : super(MovieDetailsIdle());
  MovieDetailsModel? movieDetailsModel;

  Future<void> emitMovieDetails(String id) async {
    try {
      emit(MovieDetailsLoading());

      ApiResult<MovieDetailsModel?> response =
          await moviesRepository.getMovieDetails(id);

      response.when(success: (movieDetailsResult) {
        movieDetailsModel = movieDetailsResult!;
        emit(MovieDetailsSuccess(
          movieDetailsModel: movieDetailsResult,
        ));
      }, failure: (NetworkExceptions networkExceptions) {
        emit(MovieDetailsError(
          networkExceptions: networkExceptions,
        ));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  UserDetailsModel? userDetails;

  Future<void> emitGetUserDetails() async {
    if (await SharedPrefs.checkValue(sessionIdKey)) {
      try {
        var sessionID = await SharedPrefs.getStringValuesSF(sessionIdKey);
        ApiResult<UserDetailsModel?> response =
            await accountRepository.getUserDetails(sessionID);
        response.when(success: (userDetailsResult) async {
          userDetails = userDetailsResult!;
          saveUserId(userDetailsResult.id!);
          emit(UserDetailsSuccess(userDetails: userDetailsResult));
        }, failure: (NetworkExceptions networkExceptions) {
          emit(MovieDetailsError(
            networkExceptions: networkExceptions,
          ));
        });
      } catch (e) {
        print(e.toString());
      }
    } else {
      print('Session ID Not found');
    }
  }

  Future<void> saveUserId(int userId) async {
    if (!(await SharedPrefs.checkValue(userIdKey))) {
      await SharedPrefs.addIntToSF(userIdKey, userId);
    }
  }

  FavoriteModel? favoriteModel;

  Future<void> emitMarkAsFavorite(FavoriteBody favoriteBody) async {
    emit(MarkFavoriteLoading());
    await emitGetUserDetails();

    if (await SharedPrefs.checkValue(sessionIdKey) &&
        await SharedPrefs.checkValue(userIdKey)) {
      String sessionId = await SharedPrefs.getStringValuesSF(sessionIdKey);
      int userId = await SharedPrefs.getIntValuesSF(userIdKey);
      try {
        ApiResult<FavoriteModel?> response = await accountRepository
            .markMovieAsFavorite(sessionId, userId, favoriteBody);
        saveFavorite();
        response.when(success: (favoriteResult) {
          favoriteModel = favoriteResult!;
          emit(MarkFavoriteSuccess(favoriteModel: favoriteResult));
        }, failure: (NetworkExceptions networkExceptions) {
          emit(MarkFavoriteError(networkExceptions: networkExceptions));
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
