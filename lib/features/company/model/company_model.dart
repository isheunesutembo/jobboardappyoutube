import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobboardapp/config/config.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed 
abstract class CompanyModel with _$CompanyModel{
  @JsonSerializable(explicitToJson:true,anyMap:true)

  factory CompanyModel(
    {
      String? companyId,
      String? name,
      String? address,
      String? logo,
      String? phoneNumber,
      String? siteLink,
      String? email,
      
    }
  )=_CompanyModel;

  factory CompanyModel.fromJson(Map<String,dynamic>json)=>
  _$CompanyModelFromJson(json);

 
}
 