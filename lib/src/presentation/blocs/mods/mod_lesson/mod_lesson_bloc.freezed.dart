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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getLessonByCourse,
    required TResult Function(int lessonId) getLesson,
    required TResult Function(int lessonId) getPagesLesson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getLessonByCourse,
    TResult? Function(int lessonId)? getLesson,
    TResult? Function(int lessonId)? getPagesLesson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getLessonByCourse,
    TResult Function(int lessonId)? getLesson,
    TResult Function(int lessonId)? getPagesLesson,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLessonByCourse value) getLessonByCourse,
    required TResult Function(_GetLesson value) getLesson,
    required TResult Function(_GetPagesLesson value) getPagesLesson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult? Function(_GetLesson value)? getLesson,
    TResult? Function(_GetPagesLesson value)? getPagesLesson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult Function(_GetLesson value)? getLesson,
    TResult Function(_GetPagesLesson value)? getPagesLesson,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModLessonEventCopyWith<$Res> {
  factory $ModLessonEventCopyWith(
          ModLessonEvent value, $Res Function(ModLessonEvent) then) =
      _$ModLessonEventCopyWithImpl<$Res, ModLessonEvent>;
}

/// @nodoc
class _$ModLessonEventCopyWithImpl<$Res, $Val extends ModLessonEvent>
    implements $ModLessonEventCopyWith<$Res> {
  _$ModLessonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetLessonByCourseCopyWith<$Res> {
  factory _$$_GetLessonByCourseCopyWith(_$_GetLessonByCourse value,
          $Res Function(_$_GetLessonByCourse) then) =
      __$$_GetLessonByCourseCopyWithImpl<$Res>;
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
    required TResult Function(int lessonId) getLesson,
    required TResult Function(int lessonId) getPagesLesson,
  }) {
    return getLessonByCourse(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getLessonByCourse,
    TResult? Function(int lessonId)? getLesson,
    TResult? Function(int lessonId)? getPagesLesson,
  }) {
    return getLessonByCourse?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getLessonByCourse,
    TResult Function(int lessonId)? getLesson,
    TResult Function(int lessonId)? getPagesLesson,
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
    required TResult Function(_GetLesson value) getLesson,
    required TResult Function(_GetPagesLesson value) getPagesLesson,
  }) {
    return getLessonByCourse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult? Function(_GetLesson value)? getLesson,
    TResult? Function(_GetPagesLesson value)? getPagesLesson,
  }) {
    return getLessonByCourse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult Function(_GetLesson value)? getLesson,
    TResult Function(_GetPagesLesson value)? getPagesLesson,
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

  int get courseId;
  @JsonKey(ignore: true)
  _$$_GetLessonByCourseCopyWith<_$_GetLessonByCourse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetLessonCopyWith<$Res> {
  factory _$$_GetLessonCopyWith(
          _$_GetLesson value, $Res Function(_$_GetLesson) then) =
      __$$_GetLessonCopyWithImpl<$Res>;
  @useResult
  $Res call({int lessonId});
}

/// @nodoc
class __$$_GetLessonCopyWithImpl<$Res>
    extends _$ModLessonEventCopyWithImpl<$Res, _$_GetLesson>
    implements _$$_GetLessonCopyWith<$Res> {
  __$$_GetLessonCopyWithImpl(
      _$_GetLesson _value, $Res Function(_$_GetLesson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
  }) {
    return _then(_$_GetLesson(
      null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetLesson implements _GetLesson {
  const _$_GetLesson(this.lessonId);

  @override
  final int lessonId;

  @override
  String toString() {
    return 'ModLessonEvent.getLesson(lessonId: $lessonId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetLesson &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetLessonCopyWith<_$_GetLesson> get copyWith =>
      __$$_GetLessonCopyWithImpl<_$_GetLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getLessonByCourse,
    required TResult Function(int lessonId) getLesson,
    required TResult Function(int lessonId) getPagesLesson,
  }) {
    return getLesson(lessonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getLessonByCourse,
    TResult? Function(int lessonId)? getLesson,
    TResult? Function(int lessonId)? getPagesLesson,
  }) {
    return getLesson?.call(lessonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getLessonByCourse,
    TResult Function(int lessonId)? getLesson,
    TResult Function(int lessonId)? getPagesLesson,
    required TResult orElse(),
  }) {
    if (getLesson != null) {
      return getLesson(lessonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLessonByCourse value) getLessonByCourse,
    required TResult Function(_GetLesson value) getLesson,
    required TResult Function(_GetPagesLesson value) getPagesLesson,
  }) {
    return getLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult? Function(_GetLesson value)? getLesson,
    TResult? Function(_GetPagesLesson value)? getPagesLesson,
  }) {
    return getLesson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult Function(_GetLesson value)? getLesson,
    TResult Function(_GetPagesLesson value)? getPagesLesson,
    required TResult orElse(),
  }) {
    if (getLesson != null) {
      return getLesson(this);
    }
    return orElse();
  }
}

abstract class _GetLesson implements ModLessonEvent {
  const factory _GetLesson(final int lessonId) = _$_GetLesson;

  int get lessonId;
  @JsonKey(ignore: true)
  _$$_GetLessonCopyWith<_$_GetLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetPagesLessonCopyWith<$Res> {
  factory _$$_GetPagesLessonCopyWith(
          _$_GetPagesLesson value, $Res Function(_$_GetPagesLesson) then) =
      __$$_GetPagesLessonCopyWithImpl<$Res>;
  @useResult
  $Res call({int lessonId});
}

/// @nodoc
class __$$_GetPagesLessonCopyWithImpl<$Res>
    extends _$ModLessonEventCopyWithImpl<$Res, _$_GetPagesLesson>
    implements _$$_GetPagesLessonCopyWith<$Res> {
  __$$_GetPagesLessonCopyWithImpl(
      _$_GetPagesLesson _value, $Res Function(_$_GetPagesLesson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
  }) {
    return _then(_$_GetPagesLesson(
      null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetPagesLesson implements _GetPagesLesson {
  const _$_GetPagesLesson(this.lessonId);

  @override
  final int lessonId;

  @override
  String toString() {
    return 'ModLessonEvent.getPagesLesson(lessonId: $lessonId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPagesLesson &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetPagesLessonCopyWith<_$_GetPagesLesson> get copyWith =>
      __$$_GetPagesLessonCopyWithImpl<_$_GetPagesLesson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getLessonByCourse,
    required TResult Function(int lessonId) getLesson,
    required TResult Function(int lessonId) getPagesLesson,
  }) {
    return getPagesLesson(lessonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getLessonByCourse,
    TResult? Function(int lessonId)? getLesson,
    TResult? Function(int lessonId)? getPagesLesson,
  }) {
    return getPagesLesson?.call(lessonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getLessonByCourse,
    TResult Function(int lessonId)? getLesson,
    TResult Function(int lessonId)? getPagesLesson,
    required TResult orElse(),
  }) {
    if (getPagesLesson != null) {
      return getPagesLesson(lessonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLessonByCourse value) getLessonByCourse,
    required TResult Function(_GetLesson value) getLesson,
    required TResult Function(_GetPagesLesson value) getPagesLesson,
  }) {
    return getPagesLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult? Function(_GetLesson value)? getLesson,
    TResult? Function(_GetPagesLesson value)? getPagesLesson,
  }) {
    return getPagesLesson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLessonByCourse value)? getLessonByCourse,
    TResult Function(_GetLesson value)? getLesson,
    TResult Function(_GetPagesLesson value)? getPagesLesson,
    required TResult orElse(),
  }) {
    if (getPagesLesson != null) {
      return getPagesLesson(this);
    }
    return orElse();
  }
}

abstract class _GetPagesLesson implements ModLessonEvent {
  const factory _GetPagesLesson(final int lessonId) = _$_GetPagesLesson;

  int get lessonId;
  @JsonKey(ignore: true)
  _$$_GetPagesLessonCopyWith<_$_GetPagesLesson> get copyWith =>
      throw _privateConstructorUsedError;
}
