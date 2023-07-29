// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_resource_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModResourceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getResourceByCourse,
    required TResult Function(int resourceId) viewResource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getResourceByCourse,
    TResult? Function(int resourceId)? viewResource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getResourceByCourse,
    TResult Function(int resourceId)? viewResource,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResourceByCourse value) getResourceByCourse,
    required TResult Function(_ViewResource value) viewResource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResourceByCourse value)? getResourceByCourse,
    TResult? Function(_ViewResource value)? viewResource,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResourceByCourse value)? getResourceByCourse,
    TResult Function(_ViewResource value)? viewResource,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModResourceEventCopyWith<$Res> {
  factory $ModResourceEventCopyWith(
          ModResourceEvent value, $Res Function(ModResourceEvent) then) =
      _$ModResourceEventCopyWithImpl<$Res, ModResourceEvent>;
}

/// @nodoc
class _$ModResourceEventCopyWithImpl<$Res, $Val extends ModResourceEvent>
    implements $ModResourceEventCopyWith<$Res> {
  _$ModResourceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetResourceByCourseCopyWith<$Res> {
  factory _$$_GetResourceByCourseCopyWith(_$_GetResourceByCourse value,
          $Res Function(_$_GetResourceByCourse) then) =
      __$$_GetResourceByCourseCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_GetResourceByCourseCopyWithImpl<$Res>
    extends _$ModResourceEventCopyWithImpl<$Res, _$_GetResourceByCourse>
    implements _$$_GetResourceByCourseCopyWith<$Res> {
  __$$_GetResourceByCourseCopyWithImpl(_$_GetResourceByCourse _value,
      $Res Function(_$_GetResourceByCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_GetResourceByCourse(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetResourceByCourse implements _GetResourceByCourse {
  const _$_GetResourceByCourse(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'ModResourceEvent.getResourceByCourse(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetResourceByCourse &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetResourceByCourseCopyWith<_$_GetResourceByCourse> get copyWith =>
      __$$_GetResourceByCourseCopyWithImpl<_$_GetResourceByCourse>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getResourceByCourse,
    required TResult Function(int resourceId) viewResource,
  }) {
    return getResourceByCourse(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getResourceByCourse,
    TResult? Function(int resourceId)? viewResource,
  }) {
    return getResourceByCourse?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getResourceByCourse,
    TResult Function(int resourceId)? viewResource,
    required TResult orElse(),
  }) {
    if (getResourceByCourse != null) {
      return getResourceByCourse(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResourceByCourse value) getResourceByCourse,
    required TResult Function(_ViewResource value) viewResource,
  }) {
    return getResourceByCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResourceByCourse value)? getResourceByCourse,
    TResult? Function(_ViewResource value)? viewResource,
  }) {
    return getResourceByCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResourceByCourse value)? getResourceByCourse,
    TResult Function(_ViewResource value)? viewResource,
    required TResult orElse(),
  }) {
    if (getResourceByCourse != null) {
      return getResourceByCourse(this);
    }
    return orElse();
  }
}

abstract class _GetResourceByCourse implements ModResourceEvent {
  const factory _GetResourceByCourse(final int courseId) =
      _$_GetResourceByCourse;

  int get courseId;
  @JsonKey(ignore: true)
  _$$_GetResourceByCourseCopyWith<_$_GetResourceByCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ViewResourceCopyWith<$Res> {
  factory _$$_ViewResourceCopyWith(
          _$_ViewResource value, $Res Function(_$_ViewResource) then) =
      __$$_ViewResourceCopyWithImpl<$Res>;
  @useResult
  $Res call({int resourceId});
}

/// @nodoc
class __$$_ViewResourceCopyWithImpl<$Res>
    extends _$ModResourceEventCopyWithImpl<$Res, _$_ViewResource>
    implements _$$_ViewResourceCopyWith<$Res> {
  __$$_ViewResourceCopyWithImpl(
      _$_ViewResource _value, $Res Function(_$_ViewResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceId = null,
  }) {
    return _then(_$_ViewResource(
      null == resourceId
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ViewResource implements _ViewResource {
  const _$_ViewResource(this.resourceId);

  @override
  final int resourceId;

  @override
  String toString() {
    return 'ModResourceEvent.viewResource(resourceId: $resourceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewResource &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resourceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewResourceCopyWith<_$_ViewResource> get copyWith =>
      __$$_ViewResourceCopyWithImpl<_$_ViewResource>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getResourceByCourse,
    required TResult Function(int resourceId) viewResource,
  }) {
    return viewResource(resourceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getResourceByCourse,
    TResult? Function(int resourceId)? viewResource,
  }) {
    return viewResource?.call(resourceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getResourceByCourse,
    TResult Function(int resourceId)? viewResource,
    required TResult orElse(),
  }) {
    if (viewResource != null) {
      return viewResource(resourceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResourceByCourse value) getResourceByCourse,
    required TResult Function(_ViewResource value) viewResource,
  }) {
    return viewResource(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResourceByCourse value)? getResourceByCourse,
    TResult? Function(_ViewResource value)? viewResource,
  }) {
    return viewResource?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResourceByCourse value)? getResourceByCourse,
    TResult Function(_ViewResource value)? viewResource,
    required TResult orElse(),
  }) {
    if (viewResource != null) {
      return viewResource(this);
    }
    return orElse();
  }
}

abstract class _ViewResource implements ModResourceEvent {
  const factory _ViewResource(final int resourceId) = _$_ViewResource;

  int get resourceId;
  @JsonKey(ignore: true)
  _$$_ViewResourceCopyWith<_$_ViewResource> get copyWith =>
      throw _privateConstructorUsedError;
}
