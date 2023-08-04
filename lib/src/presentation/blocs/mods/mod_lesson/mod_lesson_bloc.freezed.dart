// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_lesson_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModLessonEvent {
  int get courseId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getLessonByCourse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getLessonByCourse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getLessonByCourse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLessonByCourse value) getLessonByCourse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLessonByCourse value)? getLessonByCourse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLessonByCourse value)? getLessonByCourse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ModLessonEventCopyWith<ModLessonEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModLessonEventCopyWith<$Res> {
  factory $ModLessonEventCopyWith(
          ModLessonEvent value, $Res Function(ModLessonEvent) then) =
      _$ModLessonEventCopyWithImpl<$Res, ModLessonEvent>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class _$ModLessonEventCopyWithImpl<$Res, $Val extends ModLessonEvent>
    implements $ModLessonEventCopyWith<$Res> {
  _$ModLessonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_value.copyWith(
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetLessonByCourseCopyWith<$Res>
    implements $ModLessonEventCopyWith<$Res> {
  factory _$$_GetLessonByCourseCopyWith(_$_GetLessonByCourse value,
          $Res Function(_$_GetLessonByCourse) then) =
      __$$_GetLessonByCourseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_GetLessonByCourseCopyWithImpl<$Res>
    extends _$ModLessonEventCopyWithImpl<$Res, _$_GetLessonByCourse>
    implements _$$_GetLessonByCourseCopyWith<$Res> {
  __$$_GetLessonByCourseCopyWithImpl(
      _$_GetLessonByCourse _value, $Res Function(_$_GetLessonByCourse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_GetLessonByCourse(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetLessonByCourse implements _GetLessonByCourse {
  const _$_GetLessonByCourse(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'ModLessonEvent.getLessonByCourse(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetLessonByCourse &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetLessonByCourseCopyWith<_$_GetLessonByCourse> get copyWith =>
      __$$_GetLessonByCourseCopyWithImpl<_$_GetLessonByCourse>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getLessonByCourse,
  }) {
    return getLessonByCourse(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getLessonByCourse,
  }) {
    return getLessonByCourse?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getLessonByCourse,
    required TResult orElse(),
  }) {
    if (getLessonByCourse != null) {
      return getLessonByCourse(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLessonByCourse value) getLessonByCourse,
  }) {
    return getLessonByCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLessonByCourse value)? getLessonByCourse,
  }) {
    return getLessonByCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLessonByCourse value)? getLessonByCourse,
    required TResult orElse(),
  }) {
    if (getLessonByCourse != null) {
      return getLessonByCourse(this);
    }
    return orElse();
  }
}

abstract class _GetLessonByCourse implements ModLessonEvent {
  const factory _GetLessonByCourse(final int courseId) = _$_GetLessonByCourse;

  @override
  int get courseId;
  @override
  @JsonKey(ignore: true)
  _$$_GetLessonByCourseCopyWith<_$_GetLessonByCourse> get copyWith =>
      throw _privateConstructorUsedError;
}
