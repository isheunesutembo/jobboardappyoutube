import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobboardapp/config/config.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';

part 'favourite_model.freezed.dart';
part 'favourite_model.g.dart';
List<FavouriteModel>favouritesFromJson(dynamic str)=>
List<FavouriteModel>.from((str).map((e)=>FavouriteModel.fromJson(e)));
@freezed 
abstract class FavouriteModel with _$FavouriteModel{
  @JsonSerializable(explicitToJson:true,anyMap:true)

  factory FavouriteModel(
    {
      VacancyModel? vacancy,
      String? userId,
      String? favouriteId
      
    }
  )=_FavouriteModel;

  factory FavouriteModel.fromJson(Map<String,dynamic>json)=>
  _$FavouriteModelFromJson(json);

 
}
 