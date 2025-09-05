// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) {
  return _FavouriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavouriteModel {
  VacancyModel? get vacancy => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get favouriteId => throw _privateConstructorUsedError;

  /// Serializes this FavouriteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavouriteModelCopyWith<FavouriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteModelCopyWith<$Res> {
  factory $FavouriteModelCopyWith(
    FavouriteModel value,
    $Res Function(FavouriteModel) then,
  ) = _$FavouriteModelCopyWithImpl<$Res, FavouriteModel>;
  @useResult
  $Res call({VacancyModel? vacancy, String? userId, String? favouriteId});

  $VacancyModelCopyWith<$Res>? get vacancy;
}

/// @nodoc
class _$FavouriteModelCopyWithImpl<$Res, $Val extends FavouriteModel>
    implements $FavouriteModelCopyWith<$Res> {
  _$FavouriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancy = freezed,
    Object? userId = freezed,
    Object? favouriteId = freezed,
  }) {
    return _then(
      _value.copyWith(
            vacancy:
                freezed == vacancy
                    ? _value.vacancy
                    : vacancy // ignore: cast_nullable_to_non_nullable
                        as VacancyModel?,
            userId:
                freezed == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String?,
            favouriteId:
                freezed == favouriteId
                    ? _value.favouriteId
                    : favouriteId // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VacancyModelCopyWith<$Res>? get vacancy {
    if (_value.vacancy == null) {
      return null;
    }

    return $VacancyModelCopyWith<$Res>(_value.vacancy!, (value) {
      return _then(_value.copyWith(vacancy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavouriteModelImplCopyWith<$Res>
    implements $FavouriteModelCopyWith<$Res> {
  factory _$$FavouriteModelImplCopyWith(
    _$FavouriteModelImpl value,
    $Res Function(_$FavouriteModelImpl) then,
  ) = __$$FavouriteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VacancyModel? vacancy, String? userId, String? favouriteId});

  @override
  $VacancyModelCopyWith<$Res>? get vacancy;
}

/// @nodoc
class __$$FavouriteModelImplCopyWithImpl<$Res>
    extends _$FavouriteModelCopyWithImpl<$Res, _$FavouriteModelImpl>
    implements _$$FavouriteModelImplCopyWith<$Res> {
  __$$FavouriteModelImplCopyWithImpl(
    _$FavouriteModelImpl _value,
    $Res Function(_$FavouriteModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vacancy = freezed,
    Object? userId = freezed,
    Object? favouriteId = freezed,
  }) {
    return _then(
      _$FavouriteModelImpl(
        vacancy:
            freezed == vacancy
                ? _value.vacancy
                : vacancy // ignore: cast_nullable_to_non_nullable
                    as VacancyModel?,
        userId:
            freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String?,
        favouriteId:
            freezed == favouriteId
                ? _value.favouriteId
                : favouriteId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$FavouriteModelImpl implements _FavouriteModel {
  _$FavouriteModelImpl({this.vacancy, this.userId, this.favouriteId});

  factory _$FavouriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteModelImplFromJson(json);

  @override
  final VacancyModel? vacancy;
  @override
  final String? userId;
  @override
  final String? favouriteId;

  @override
  String toString() {
    return 'FavouriteModel(vacancy: $vacancy, userId: $userId, favouriteId: $favouriteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteModelImpl &&
            (identical(other.vacancy, vacancy) || other.vacancy == vacancy) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.favouriteId, favouriteId) ||
                other.favouriteId == favouriteId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vacancy, userId, favouriteId);

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteModelImplCopyWith<_$FavouriteModelImpl> get copyWith =>
      __$$FavouriteModelImplCopyWithImpl<_$FavouriteModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteModelImplToJson(this);
  }
}

abstract class _FavouriteModel implements FavouriteModel {
  factory _FavouriteModel({
    final VacancyModel? vacancy,
    final String? userId,
    final String? favouriteId,
  }) = _$FavouriteModelImpl;

  factory _FavouriteModel.fromJson(Map<String, dynamic> json) =
      _$FavouriteModelImpl.fromJson;

  @override
  VacancyModel? get vacancy;
  @override
  String? get userId;
  @override
  String? get favouriteId;

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavouriteModelImplCopyWith<_$FavouriteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
