import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/badge_model.dart';
import '../../../domain/usecase/badge/badge.dart';

part 'badge_event.dart';
part 'badge_state.dart';
part 'badge_bloc.freezed.dart';

class GetBadgeBloc extends Bloc<BadgeEvent, BadgeState> {
  final GetBadge _getBadge;

  GetBadgeBloc(this._getBadge) : super(const BadgeState.initial()) {
    on<BadgeEvent>((event, emit) async {
      await event.whenOrNull(
        getBadge: () async {
          emit(const BadgeState.loading());
          final result = await _getBadge.execute();
          emit(result.fold(
            (failure) => BadgeState.error(failure.message),
            (data) => BadgeState.loaded(data),
          ));
        },
      );
    });
  }
}

class GetBadgeImageBloc extends Bloc<BadgeEvent, String> {
  final GetBadgeImage _getBadgeImage;

  GetBadgeImageBloc(this._getBadgeImage) : super("") {
    on<BadgeEvent>(
      (event, emit) async {
        await event.whenOrNull(
          getBadgeImage: (badge) async {
            final result = await _getBadgeImage.execute(badge);
            emit(result);
          },
        );
      },
    );
  }
}
