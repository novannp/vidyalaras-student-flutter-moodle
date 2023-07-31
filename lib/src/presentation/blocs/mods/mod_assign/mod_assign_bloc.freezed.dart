// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mod_assign_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ModAssignEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getAssignmentList,
    required TResult Function(int assignId) getSubmissionStatus,
    required TResult Function(int assignId, int itemId) submitSubmission,
    required TResult Function(int assignId) viewSubmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getAssignmentList,
    TResult? Function(int assignId)? getSubmissionStatus,
    TResult? Function(int assignId, int itemId)? submitSubmission,
    TResult? Function(int assignId)? viewSubmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getAssignmentList,
    TResult Function(int assignId)? getSubmissionStatus,
    TResult Function(int assignId, int itemId)? submitSubmission,
    TResult Function(int assignId)? viewSubmission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAssignmentList value) getAssignmentList,
    required TResult Function(_GetSubmissionStatus value) getSubmissionStatus,
    required TResult Function(_SubmitSubmission value) submitSubmission,
    required TResult Function(_ViewSubmission value) viewSubmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAssignmentList value)? getAssignmentList,
    TResult? Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult? Function(_SubmitSubmission value)? submitSubmission,
    TResult? Function(_ViewSubmission value)? viewSubmission,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAssignmentList value)? getAssignmentList,
    TResult Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult Function(_SubmitSubmission value)? submitSubmission,
    TResult Function(_ViewSubmission value)? viewSubmission,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModAssignEventCopyWith<$Res> {
  factory $ModAssignEventCopyWith(
          ModAssignEvent value, $Res Function(ModAssignEvent) then) =
      _$ModAssignEventCopyWithImpl<$Res, ModAssignEvent>;
}

/// @nodoc
class _$ModAssignEventCopyWithImpl<$Res, $Val extends ModAssignEvent>
    implements $ModAssignEventCopyWith<$Res> {
  _$ModAssignEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetAssignmentListCopyWith<$Res> {
  factory _$$_GetAssignmentListCopyWith(_$_GetAssignmentList value,
          $Res Function(_$_GetAssignmentList) then) =
      __$$_GetAssignmentListCopyWithImpl<$Res>;
  @useResult
  $Res call({int courseId});
}

/// @nodoc
class __$$_GetAssignmentListCopyWithImpl<$Res>
    extends _$ModAssignEventCopyWithImpl<$Res, _$_GetAssignmentList>
    implements _$$_GetAssignmentListCopyWith<$Res> {
  __$$_GetAssignmentListCopyWithImpl(
      _$_GetAssignmentList _value, $Res Function(_$_GetAssignmentList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_$_GetAssignmentList(
      null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetAssignmentList implements _GetAssignmentList {
  const _$_GetAssignmentList(this.courseId);

  @override
  final int courseId;

  @override
  String toString() {
    return 'ModAssignEvent.getAssignmentList(courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetAssignmentList &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetAssignmentListCopyWith<_$_GetAssignmentList> get copyWith =>
      __$$_GetAssignmentListCopyWithImpl<_$_GetAssignmentList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getAssignmentList,
    required TResult Function(int assignId) getSubmissionStatus,
    required TResult Function(int assignId, int itemId) submitSubmission,
    required TResult Function(int assignId) viewSubmission,
  }) {
    return getAssignmentList(courseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getAssignmentList,
    TResult? Function(int assignId)? getSubmissionStatus,
    TResult? Function(int assignId, int itemId)? submitSubmission,
    TResult? Function(int assignId)? viewSubmission,
  }) {
    return getAssignmentList?.call(courseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getAssignmentList,
    TResult Function(int assignId)? getSubmissionStatus,
    TResult Function(int assignId, int itemId)? submitSubmission,
    TResult Function(int assignId)? viewSubmission,
    required TResult orElse(),
  }) {
    if (getAssignmentList != null) {
      return getAssignmentList(courseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAssignmentList value) getAssignmentList,
    required TResult Function(_GetSubmissionStatus value) getSubmissionStatus,
    required TResult Function(_SubmitSubmission value) submitSubmission,
    required TResult Function(_ViewSubmission value) viewSubmission,
  }) {
    return getAssignmentList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAssignmentList value)? getAssignmentList,
    TResult? Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult? Function(_SubmitSubmission value)? submitSubmission,
    TResult? Function(_ViewSubmission value)? viewSubmission,
  }) {
    return getAssignmentList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAssignmentList value)? getAssignmentList,
    TResult Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult Function(_SubmitSubmission value)? submitSubmission,
    TResult Function(_ViewSubmission value)? viewSubmission,
    required TResult orElse(),
  }) {
    if (getAssignmentList != null) {
      return getAssignmentList(this);
    }
    return orElse();
  }
}

abstract class _GetAssignmentList implements ModAssignEvent {
  const factory _GetAssignmentList(final int courseId) = _$_GetAssignmentList;

  int get courseId;
  @JsonKey(ignore: true)
  _$$_GetAssignmentListCopyWith<_$_GetAssignmentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSubmissionStatusCopyWith<$Res> {
  factory _$$_GetSubmissionStatusCopyWith(_$_GetSubmissionStatus value,
          $Res Function(_$_GetSubmissionStatus) then) =
      __$$_GetSubmissionStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({int assignId});
}

/// @nodoc
class __$$_GetSubmissionStatusCopyWithImpl<$Res>
    extends _$ModAssignEventCopyWithImpl<$Res, _$_GetSubmissionStatus>
    implements _$$_GetSubmissionStatusCopyWith<$Res> {
  __$$_GetSubmissionStatusCopyWithImpl(_$_GetSubmissionStatus _value,
      $Res Function(_$_GetSubmissionStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignId = null,
  }) {
    return _then(_$_GetSubmissionStatus(
      null == assignId
          ? _value.assignId
          : assignId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetSubmissionStatus implements _GetSubmissionStatus {
  const _$_GetSubmissionStatus(this.assignId);

  @override
  final int assignId;

  @override
  String toString() {
    return 'ModAssignEvent.getSubmissionStatus(assignId: $assignId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSubmissionStatus &&
            (identical(other.assignId, assignId) ||
                other.assignId == assignId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assignId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetSubmissionStatusCopyWith<_$_GetSubmissionStatus> get copyWith =>
      __$$_GetSubmissionStatusCopyWithImpl<_$_GetSubmissionStatus>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getAssignmentList,
    required TResult Function(int assignId) getSubmissionStatus,
    required TResult Function(int assignId, int itemId) submitSubmission,
    required TResult Function(int assignId) viewSubmission,
  }) {
    return getSubmissionStatus(assignId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getAssignmentList,
    TResult? Function(int assignId)? getSubmissionStatus,
    TResult? Function(int assignId, int itemId)? submitSubmission,
    TResult? Function(int assignId)? viewSubmission,
  }) {
    return getSubmissionStatus?.call(assignId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getAssignmentList,
    TResult Function(int assignId)? getSubmissionStatus,
    TResult Function(int assignId, int itemId)? submitSubmission,
    TResult Function(int assignId)? viewSubmission,
    required TResult orElse(),
  }) {
    if (getSubmissionStatus != null) {
      return getSubmissionStatus(assignId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAssignmentList value) getAssignmentList,
    required TResult Function(_GetSubmissionStatus value) getSubmissionStatus,
    required TResult Function(_SubmitSubmission value) submitSubmission,
    required TResult Function(_ViewSubmission value) viewSubmission,
  }) {
    return getSubmissionStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAssignmentList value)? getAssignmentList,
    TResult? Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult? Function(_SubmitSubmission value)? submitSubmission,
    TResult? Function(_ViewSubmission value)? viewSubmission,
  }) {
    return getSubmissionStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAssignmentList value)? getAssignmentList,
    TResult Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult Function(_SubmitSubmission value)? submitSubmission,
    TResult Function(_ViewSubmission value)? viewSubmission,
    required TResult orElse(),
  }) {
    if (getSubmissionStatus != null) {
      return getSubmissionStatus(this);
    }
    return orElse();
  }
}

abstract class _GetSubmissionStatus implements ModAssignEvent {
  const factory _GetSubmissionStatus(final int assignId) =
      _$_GetSubmissionStatus;

  int get assignId;
  @JsonKey(ignore: true)
  _$$_GetSubmissionStatusCopyWith<_$_GetSubmissionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubmitSubmissionCopyWith<$Res> {
  factory _$$_SubmitSubmissionCopyWith(
          _$_SubmitSubmission value, $Res Function(_$_SubmitSubmission) then) =
      __$$_SubmitSubmissionCopyWithImpl<$Res>;
  @useResult
  $Res call({int assignId, int itemId});
}

/// @nodoc
class __$$_SubmitSubmissionCopyWithImpl<$Res>
    extends _$ModAssignEventCopyWithImpl<$Res, _$_SubmitSubmission>
    implements _$$_SubmitSubmissionCopyWith<$Res> {
  __$$_SubmitSubmissionCopyWithImpl(
      _$_SubmitSubmission _value, $Res Function(_$_SubmitSubmission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignId = null,
    Object? itemId = null,
  }) {
    return _then(_$_SubmitSubmission(
      null == assignId
          ? _value.assignId
          : assignId // ignore: cast_nullable_to_non_nullable
              as int,
      null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SubmitSubmission implements _SubmitSubmission {
  const _$_SubmitSubmission(this.assignId, this.itemId);

  @override
  final int assignId;
  @override
  final int itemId;

  @override
  String toString() {
    return 'ModAssignEvent.submitSubmission(assignId: $assignId, itemId: $itemId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitSubmission &&
            (identical(other.assignId, assignId) ||
                other.assignId == assignId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assignId, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitSubmissionCopyWith<_$_SubmitSubmission> get copyWith =>
      __$$_SubmitSubmissionCopyWithImpl<_$_SubmitSubmission>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getAssignmentList,
    required TResult Function(int assignId) getSubmissionStatus,
    required TResult Function(int assignId, int itemId) submitSubmission,
    required TResult Function(int assignId) viewSubmission,
  }) {
    return submitSubmission(assignId, itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getAssignmentList,
    TResult? Function(int assignId)? getSubmissionStatus,
    TResult? Function(int assignId, int itemId)? submitSubmission,
    TResult? Function(int assignId)? viewSubmission,
  }) {
    return submitSubmission?.call(assignId, itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getAssignmentList,
    TResult Function(int assignId)? getSubmissionStatus,
    TResult Function(int assignId, int itemId)? submitSubmission,
    TResult Function(int assignId)? viewSubmission,
    required TResult orElse(),
  }) {
    if (submitSubmission != null) {
      return submitSubmission(assignId, itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAssignmentList value) getAssignmentList,
    required TResult Function(_GetSubmissionStatus value) getSubmissionStatus,
    required TResult Function(_SubmitSubmission value) submitSubmission,
    required TResult Function(_ViewSubmission value) viewSubmission,
  }) {
    return submitSubmission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAssignmentList value)? getAssignmentList,
    TResult? Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult? Function(_SubmitSubmission value)? submitSubmission,
    TResult? Function(_ViewSubmission value)? viewSubmission,
  }) {
    return submitSubmission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAssignmentList value)? getAssignmentList,
    TResult Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult Function(_SubmitSubmission value)? submitSubmission,
    TResult Function(_ViewSubmission value)? viewSubmission,
    required TResult orElse(),
  }) {
    if (submitSubmission != null) {
      return submitSubmission(this);
    }
    return orElse();
  }
}

abstract class _SubmitSubmission implements ModAssignEvent {
  const factory _SubmitSubmission(final int assignId, final int itemId) =
      _$_SubmitSubmission;

  int get assignId;
  int get itemId;
  @JsonKey(ignore: true)
  _$$_SubmitSubmissionCopyWith<_$_SubmitSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ViewSubmissionCopyWith<$Res> {
  factory _$$_ViewSubmissionCopyWith(
          _$_ViewSubmission value, $Res Function(_$_ViewSubmission) then) =
      __$$_ViewSubmissionCopyWithImpl<$Res>;
  @useResult
  $Res call({int assignId});
}

/// @nodoc
class __$$_ViewSubmissionCopyWithImpl<$Res>
    extends _$ModAssignEventCopyWithImpl<$Res, _$_ViewSubmission>
    implements _$$_ViewSubmissionCopyWith<$Res> {
  __$$_ViewSubmissionCopyWithImpl(
      _$_ViewSubmission _value, $Res Function(_$_ViewSubmission) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignId = null,
  }) {
    return _then(_$_ViewSubmission(
      null == assignId
          ? _value.assignId
          : assignId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ViewSubmission implements _ViewSubmission {
  const _$_ViewSubmission(this.assignId);

  @override
  final int assignId;

  @override
  String toString() {
    return 'ModAssignEvent.viewSubmission(assignId: $assignId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewSubmission &&
            (identical(other.assignId, assignId) ||
                other.assignId == assignId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assignId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewSubmissionCopyWith<_$_ViewSubmission> get copyWith =>
      __$$_ViewSubmissionCopyWithImpl<_$_ViewSubmission>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int courseId) getAssignmentList,
    required TResult Function(int assignId) getSubmissionStatus,
    required TResult Function(int assignId, int itemId) submitSubmission,
    required TResult Function(int assignId) viewSubmission,
  }) {
    return viewSubmission(assignId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int courseId)? getAssignmentList,
    TResult? Function(int assignId)? getSubmissionStatus,
    TResult? Function(int assignId, int itemId)? submitSubmission,
    TResult? Function(int assignId)? viewSubmission,
  }) {
    return viewSubmission?.call(assignId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int courseId)? getAssignmentList,
    TResult Function(int assignId)? getSubmissionStatus,
    TResult Function(int assignId, int itemId)? submitSubmission,
    TResult Function(int assignId)? viewSubmission,
    required TResult orElse(),
  }) {
    if (viewSubmission != null) {
      return viewSubmission(assignId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAssignmentList value) getAssignmentList,
    required TResult Function(_GetSubmissionStatus value) getSubmissionStatus,
    required TResult Function(_SubmitSubmission value) submitSubmission,
    required TResult Function(_ViewSubmission value) viewSubmission,
  }) {
    return viewSubmission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAssignmentList value)? getAssignmentList,
    TResult? Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult? Function(_SubmitSubmission value)? submitSubmission,
    TResult? Function(_ViewSubmission value)? viewSubmission,
  }) {
    return viewSubmission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAssignmentList value)? getAssignmentList,
    TResult Function(_GetSubmissionStatus value)? getSubmissionStatus,
    TResult Function(_SubmitSubmission value)? submitSubmission,
    TResult Function(_ViewSubmission value)? viewSubmission,
    required TResult orElse(),
  }) {
    if (viewSubmission != null) {
      return viewSubmission(this);
    }
    return orElse();
  }
}

abstract class _ViewSubmission implements ModAssignEvent {
  const factory _ViewSubmission(final int assignId) = _$_ViewSubmission;

  int get assignId;
  @JsonKey(ignore: true)
  _$$_ViewSubmissionCopyWith<_$_ViewSubmission> get copyWith =>
      throw _privateConstructorUsedError;
}
