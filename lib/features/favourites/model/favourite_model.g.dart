// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteModelImpl _$$FavouriteModelImplFromJson(Map json) =>
    _$FavouriteModelImpl(
      vacancy:
          json['vacancy'] == null
              ? null
              : VacancyModel.fromJson(
                Map<String, dynamic>.from(json['vacancy'] as Map),
              ),
      userId: json['userId'] as String?,
      favouriteId: json['favouriteId'] as String?,
    );

Map<String, dynamic> _$$FavouriteModelImplToJson(
  _$FavouriteModelImpl instance,
) => <String, dynamic>{
  'vacancy': instance.vacancy?.toJson(),
  'userId': instance.userId,
  'favouriteId': instance.favouriteId,
};
