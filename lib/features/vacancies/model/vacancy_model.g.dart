// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VacancyModelImpl _$$VacancyModelImplFromJson(Map json) => _$VacancyModelImpl(
  title: json['title'] as String?,
  description: json['description'] as String?,
  vacancyId: json['vacancyId'] as String?,
  requirements: json['requirements'] as String?,
  skillTags:
      (json['skillTags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  experience: json['experience'] as String?,
  salary: json['salary'] as String?,
  benefits: json['benefits'] as String?,
  company:
      json['company'] == null
          ? null
          : CompanyModel.fromJson(
            Map<String, dynamic>.from(json['company'] as Map),
          ),
);

Map<String, dynamic> _$$VacancyModelImplToJson(_$VacancyModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'vacancyId': instance.vacancyId,
      'requirements': instance.requirements,
      'skillTags': instance.skillTags,
      'experience': instance.experience,
      'salary': instance.salary,
      'benefits': instance.benefits,
      'company': instance.company?.toJson(),
    };
