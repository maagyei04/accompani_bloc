import 'package:accompani_bloc/core/cubits/app_user/app_user_cubit.dart';
import 'package:accompani_bloc/core/use_case/use_case.dart';
import 'package:accompani_bloc/core/entities/user.dart';
import 'package:accompani_bloc/features/auth/domain/use_cases/current_user.dart';
import 'package:accompani_bloc/features/auth/domain/use_cases/user_login.dart';
import 'package:accompani_bloc/features/auth/domain/use_cases/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (l) => emit(
        AuthFailure(l.message),
      ),
      // ignore: void_checks
      (r) {
        // ignore: avoid_print
        print(r.id);
        return _emitAuthSuccess(r, emit);
      },
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(
      AuthLoading(),
    );
    final res = await _userSignUp(UserSignUpParams(
      email: event.email,
      password: event.password,
    ));
    res.fold(
        (failure) => emit(
              AuthFailure(failure.message),
            ),
        (uid) => _emitAuthSuccess2(uid, emit));
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
        (failure) => emit(
              AuthFailure(failure.message),
            ),
        (uid) => _emitAuthSuccess2(uid, emit));
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }

  void _emitAuthSuccess2(String string, Emitter<AuthState> emit) {
    _appUserCubit.updateUser2(string);
    emit(AuthDone(string));
  }
}
