part of 'mod_resource_bloc.dart';

@freezed
class ModResourceEvent with _$ModResourceEvent {
  const factory ModResourceEvent.getResourceByCourse(int courseId) =
      _GetResourceByCourse;
  const factory ModResourceEvent.viewResource(int resourceId) = _ViewResource;
}
