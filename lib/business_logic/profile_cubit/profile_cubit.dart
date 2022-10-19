import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imdb_demo/shared/constants/strings.dart';
import 'package:imdb_demo/shared/data/models/account/profile_details_model.dart';
import 'package:imdb_demo/shared/data/repo/account_repo/acc_repo.dart';
import 'package:imdb_demo/shared/offline_data.dart';
import 'package:imdb_demo/shared/web_services/errors/api_result.dart';
import 'package:imdb_demo/shared/web_services/errors/network_exceptions.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState<UserDetailsModel>> {
  AccountRepository accountRepository;

  ProfileCubit(
    this.accountRepository,
  ) : super(const Idle());

  UserDetailsModel? userDetails;

  Future<void> emitGetUserDetails() async {
    try {
      emit(const ProfileState.loading());
      if (await SharedPrefs.checkValue(sessionId)) {
        var sessionID = await SharedPrefs.getStringValuesSF(sessionId);
        ApiResult<UserDetailsModel?> response =
            await accountRepository.getUserDetails(sessionID);
        response.when(success: (userDetailsResult) {
          userDetails = userDetailsResult!;
          emit(ProfileState.success(userDetailsResult));
        }, failure: (NetworkExceptions networkExceptions) {
          emit(ProfileState.error(networkExceptions));
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
