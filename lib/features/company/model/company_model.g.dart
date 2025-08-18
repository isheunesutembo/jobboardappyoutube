// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyModelImpl _$$CompanyModelImplFromJson(Map json) => _$CompanyModelImpl(
  companyId: json['companyId'] as String?,
  name: json['name'] as String?,
  address: json['address'] as String?,
  logo: json['logo'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  siteLink: json['siteLink'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$$CompanyModelImplToJson(_$CompanyModelImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'name': instance.name,
      'address': instance.address,
      'logo': instance.logo,
      'phoneNumber': instance.phoneNumber,
      'siteLink': instance.siteLink,
      'email': instance.email,
    };
