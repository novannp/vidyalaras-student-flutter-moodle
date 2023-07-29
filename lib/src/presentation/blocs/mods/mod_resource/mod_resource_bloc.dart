import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/usecase/mods/mod_resource/mod_resource.dart';
import '../mod_state.dart';

part 'mod_resource_event.dart';
part 'mod_resource_bloc.freezed.dart';

class GetResourceByCourseBloc extends Bloc<ModResourceEvent, ModState> {
  final GetResourceByCourse _getResourceByCourse;
  GetResourceByCourseBloc(this._getResourceByCourse)
      : super(const ModState.initial()) {
    on<ModResourceEvent>((event, emit) async {
      await event.whenOrNull(
        getResourceByCourse: (courseId) async {
          emit(const ModState.loading());
          final resourceList = await _getResourceByCourse.execute(courseId);
          resourceList.fold(
            (failure) => emit(ModState.error(failure.message)),
            (resourceList) => emit(ModState.loaded(resourceList)),
          );
        },
      );
    });
  }
}

class ViewResourceBloc extends Bloc<ModResourceEvent, ModState> {
  final ViewResource _viewResource;
  ViewResourceBloc(this._viewResource) : super(const ModState.initial()) {
    on<ModResourceEvent>((event, emit) async {
      await event.whenOrNull(
        viewResource: (resourceId) async {
          emit(const ModState.loading());
          final resourceList = await _viewResource.execute(resourceId);
          resourceList.fold(
            (failure) => emit(ModState.error(failure.message)),
            (resourceList) => emit(ModState.loaded(resourceList)),
          );
        },
      );
    });
  }
}
