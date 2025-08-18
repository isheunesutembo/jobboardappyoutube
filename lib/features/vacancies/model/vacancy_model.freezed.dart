// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vacancy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VacancyModel _$VacancyModelFromJson(Map<String, dynamic> json) {
  return _VacancyModel.fromJson(json);
}

/// @nodoc
mixin _$VacancyModel {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get vacancyId => throw _privateConstructorUsedError;
  String? get requirements => throw _privateConstructorUsedError;
  List<String>? get skillTags => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  String? get salary => throw _privateConstructorUsedError;
  String? get benefits => throw _privateConstructorUsedError;
  CompanyModel? get company => throw _privateConstructorUsedError;

  /// Serializes this VacancyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VacancyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VacancyModelCopyWith<VacancyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VacancyModelCopyWith<$Res> {
  factory $VacancyModelCopyWith(
    VacancyModel value,
    $Res Function(VacancyModel) then,
  ) = _$VacancyModelCopyWithImpl<$Res, VacancyModel>;
  @useResult
  $Res call({
    String? title,
    String? description,
    String? vacancyId,
    String? requirements,
    List<String>? skillTags,
    String? experience,
    String? salary,
    String? benefits,
    CompanyModel? company,
  });

  $CompanyModelCopyWith<$Res>? get company;
}

/// @nodoc
class _$VacancyModelCopyWithImpl<$Res, $Val extends VacancyModel>
    implements $VacancyModelCopyWith<$Res> {
  _$VacancyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VacancyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? vacancyId = freezed,
    Object? requirements = freezed,
    Object? skillTags = freezed,
    Object? experience = freezed,
    Object? salary = freezed,
    Object? benefits = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            vacancyId:
                freezed == vacancyId
                    ? _value.vacancyId
                    : vacancyId // ignore: cast_nullable_to_non_nullable
                        as String?,
            requirements:
                freezed == requirements
                    ? _value.requirements
                    : requirements // ignore: cast_nullable_to_non_nullable
                        as String?,
            skillTags:
                freezed == skillTags
                    ? _value.skillTags
                    : skillTags // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            experience:
                freezed == experience
                    ? _value.experience
                    : experience // ignore: cast_nullable_to_non_nullable
                        as String?,
            salary:
                freezed == salary
                    ? _value.salary
                    : salary // ignore: cast_nullable_to_non_nullable
                        as String?,
            benefits:
                freezed == benefits
                    ? _value.benefits
                    : benefits // ignore: cast_nullable_to_non_nullable
                        as String?,
            company:
                freezed == company
                    ? _value.company
                    : company // ignore: cast_nullable_to_non_nullable
                        as CompanyModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of VacancyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyModelCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $CompanyModelCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VacancyModelImplCopyWith<$Res>
    implements $VacancyModelCopyWith<$Res> {
  factory _$$VacancyModelImplCopyWith(
    _$VacancyModelImpl value,
    $Res Function(_$VacancyModelImpl) then,
  ) = __$$VacancyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? title,
    String? description,
    String? vacancyId,
    String? requirements,
    List<String>? skillTags,
    String? experience,
    String? salary,
    String? benefits,
    CompanyModel? company,
  });

  @override
  $CompanyModelCopyWith<$Res>? get company;
}

/// @nodoc
class __$$VacancyModelImplCopyWithImpl<$Res>
    extends _$VacancyModelCopyWithImpl<$Res, _$VacancyModelImpl>
    implements _$$VacancyModelImplCopyWith<$Res> {
  __$$VacancyModelImplCopyWithImpl(
    _$VacancyModelImpl _value,
    $Res Function(_$VacancyModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VacancyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? vacancyId = freezed,
    Object? requirements = freezed,
    Object? skillTags = freezed,
    Object? experience = freezed,
    Object? salary = freezed,
    Object? benefits = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _$VacancyModelImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        vacancyId:
            freezed == vacancyId
                ? _value.vacancyId
                : vacancyId // ignore: cast_nullable_to_non_nullable
                    as String?,
        requirements:
            freezed == requirements
                ? _value.requirements
                : requirements // ignore: cast_nullable_to_non_nullable
                    as String?,
        skillTags:
            freezed == skillTags
                ? _value._skillTags
                : skillTags // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        experience:
            freezed == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                    as String?,
        salary:
            freezed == salary
                ? _value.salary
                : salary // ignore: cast_nullable_to_non_nullable
                    as String?,
        benefits:
            freezed == benefits
                ? _value.benefits
                : benefits // ignore: cast_nullable_to_non_nullable
                    as String?,
        company:
            freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                    as CompanyModel?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$VacancyModelImpl implements _VacancyModel {
  _$VacancyModelImpl({
    this.title,
    this.description,
    this.vacancyId,
    this.requirements,
    final List<String>? skillTags,
    this.experience,
    this.salary,
    this.benefits,
    this.company,
  }) : _skillTags = skillTags;

  factory _$VacancyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VacancyModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? vacancyId;
  @override
  final String? requirements;
  final List<String>? _skillTags;
  @override
  List<String>? get skillTags {
    final value = _skillTags;
    if (value == null) return null;
    if (_skillTags is EqualUnmodifiableListView) return _skillTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? experience;
  @override
  final String? salary;
  @override
  final String? benefits;
  @override
  final CompanyModel? company;

  @override
  String toString() {
    return 'VacancyModel(title: $title, description: $description, vacancyId: $vacancyId, requirements: $requirements, skillTags: $skillTags, experience: $experience, salary: $salary, benefits: $benefits, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VacancyModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.vacancyId, vacancyId) ||
                other.vacancyId == vacancyId) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            const DeepCollectionEquality().equals(
              other._skillTags,
              _skillTags,
            ) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.benefits, benefits) ||
                other.benefits == benefits) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    vacancyId,
    requirements,
    const DeepCollectionEquality().hash(_skillTags),
    experience,
    salary,
    benefits,
    company,
  );

  /// Create a copy of VacancyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VacancyModelImplCopyWith<_$VacancyModelImpl> get copyWith =>
      __$$VacancyModelImplCopyWithImpl<_$VacancyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VacancyModelImplToJson(this);
  }
}

abstract class _VacancyModel implements VacancyModel {
  factory _VacancyModel({
    final String? title,
    final String? description,
    final String? vacancyId,
    final String? requirements,
    final List<String>? skillTags,
    final String? experience,
    final String? salary,
    final String? benefits,
    final CompanyModel? company,
  }) = _$VacancyModelImpl;

  factory _VacancyModel.fromJson(Map<String, dynamic> json) =
      _$VacancyModelImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get vacancyId;
  @override
  String? get requirements;
  @override
  List<String>? get skillTags;
  @override
  String? get experience;
  @override
  String? get salary;
  @override
  String? get benefits;
  @override
  CompanyModel? get company;

  /// Create a copy of VacancyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VacancyModelImplCopyWith<_$VacancyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
