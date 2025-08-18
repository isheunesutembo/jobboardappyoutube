

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobboardapp/config/config.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';
List<CategoryModel>jobCategoriesFromJson(dynamic str)=>
List<CategoryModel>.from((str).map((e)=>CategoryModel.fromJson(e)));
@freezed 
abstract class CategoryModel with _$CategoryModel{
  @JsonSerializable(explicitToJson:true,anyMap:true)

  factory CategoryModel(
    {
      String? title,
      String? image,
      String? categoryId,
      
    }
  )=_CategoryModel;

  factory CategoryModel.fromJson(Map<String,dynamic>json)=>
  _$CategoryModelFromJson(json);

 
}
 extension CategoryExt on CategoryModel{
    String get fullProfileImagePath=>"${AppConfig.fullImageUrl}/${image}";
  }