import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lms_pptik/src/domain/usecase/user/update_picture.dart';
import 'package:lms_pptik/src/domain/usecase/user/user.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';
// part 'user_bloc.g.dart';

class GetCurrentUserBloc extends Bloc<UserEvent, UserState> {
  final GetCurrentUser _getCurrentUser;
  GetCurrentUserBloc(this._getCurrentUser) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.whenOrNull(
        getCurrenctUser: () async {
          emit(const UserState.loading());
          final result = await _getCurrentUser();
          result.fold(
            (l) => emit(UserState.error(l.message)),
            (r) => emit(UserState.loaded(r)),
          );
        },
      );
    });
  }
}

class UpdatePictureBloc extends Bloc<UserEvent, UserState> {
  final UpdatePicture _updatePicture;
  UpdatePictureBloc(this._updatePicture) : super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.whenOrNull(
        updatePicture: (itemId) async {
          emit(const UserState.loading());
          final result = await _updatePicture.execute(itemId);
          result.fold(
            (l) => emit(UserState.error(l.message)),
            (r) => emit(UserState.loaded(r)),
          );
        },
      );
    });
  }
}
