import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobboardapp/config/config.dart';
part 'resume_model.freezed.dart';
part 'resume_model.g.dart';
List<ResumeModel>resumesFromJson(dynamic str)=>
List<ResumeModel>.from((str).map((e)=>ResumeModel.fromJson(e)));
@freezed 
abstract class ResumeModel with _$ResumeModel {
  @JsonSerializable(explicitToJson:true,anyMap:true)

  factory ResumeModel (
    {
      
    @JsonKey(name: "_id")String? id,
    String? title,
    String? userId,
    String? resume
      
    }
  )=_ResumeModel ;

  factory ResumeModel .fromJson(Map<String,dynamic>json)=>
  _$ResumeModelFromJson(json);

 
}

extension ResumeExt on ResumeModel{
  String get fullResumePath=>AppConfig.fullResumeUrl+resume!;
}