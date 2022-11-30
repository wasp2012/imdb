import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../favorite_cubit/favorite_cubit.dart';
import '../../shared/constants/strings.dart';
import '../../shared/data/models/account/favorite_model.dart';
import '../../shared/data/models/account/profile_details_model.dart';
import '../../shared/data/repo/account_repo/acc_repo.dart';
import '../../shared/offline_data.dart';
import '../../shared/web_services/errors/api_result.dart';
import '../../shared/web_services/errors/network_exceptions.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  AccountRepository? accountRepository;

  ProfileCubit(
    this.accountRepository,
  ) : super(ProfileStateIdle());

  UserDetailsModel? userDetails;

  Future<void> emitGetUserDetails() async {
    if (await SharedPrefs.checkValue(sessionIdKey)) {
      try {
        emit(ProfileStateLoading());
        var sessionID = await SharedPrefs.getStringValuesSF(sessionIdKey);
        ApiResult<UserDetailsModel?> response =
            await accountRepository!.getUserDetails(sessionID);
        response.when(
          success: (userDetailsResult) {
            userDetails = userDetailsResult!;
            saveUserId(userDetailsResult.id!);
            print(userDetailsResult.id!);
            emit(
              ProfileStateSuccess(userDetailsResult),
            );
          },
          failure: (NetworkExceptions networkExceptions) {
            emit(
              ProfileStateError(networkExceptions),
            );
          },
        );
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
}
