import 'package:accompani_bloc/core/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }
  }

  void updateUser2(String? string) {
    if (string == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn2(string));
    }
  }
}
