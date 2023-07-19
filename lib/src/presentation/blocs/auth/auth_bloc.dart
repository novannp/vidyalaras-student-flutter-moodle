import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lms_pptik/src/domain/usecase/auth/login.dart';

import '../../../domain/usecase/auth/logout.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthLoginBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  AuthLoginBloc(this.login) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.whenOrNull(
        login: (username, password) async {
          emit(const AuthState.loading());
          final result = await login.execute(username, password);
          result.fold((l) {
            emit(AuthState.failed(l.message));
          }, (r) {
            emit(const AuthState.success());
          });
        },
      );
    });
  }
}

class AuthLogoutBloc extends Bloc<AuthEvent, AuthState> {
  final Logout logout;
  AuthLogoutBloc(this.logout) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.whenOrNull(
        logout: () async {
          emit(const AuthState.loading());
          final result = await logout.execute();
          result.fold((l) {
            emit(AuthState.failed(l.message));
          }, (r) {
            emit(const AuthState.success());
          });
        },
      );
    });
  }
}
