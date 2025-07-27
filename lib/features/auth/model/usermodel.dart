

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobboardapp/config/config.dart';

part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

@freezed 
abstract class UserModel with _$UserModel{
  @JsonSerializable(explicitToJson:true,anyMap:true)

  factory UserModel(
    {
      @JsonKey(name:"_id")String? id,
      String? username,
      String? email,
      bool? varification,
      String? phone,
      String? firstname,
      String? lastname,
      String? userType,
      String? userToken,
      String? profileImage,
      String? refreshtoken
    }
  )=_UserModel;

  factory UserModel.fromJson(Map<String,dynamic>json)=>
  _$UserModelFromJson(json);

 
}
 extension UserExt on UserModel{
    String get fullProfileImagePath=>AppConfig.fullImageUrl.toString();
  }