


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/features/categories/models/category_model.dart';
import 'package:jobboardapp/features/categories/repository/category_repository.dart';
import 'package:jobboardapp/util/util.dart';
final categoriesControllerProvider=AsyncNotifierProvider<CategoryController,AsyncValue<void>>(CategoryController.new);
final getJobCategoriesProvider=FutureProvider<List<CategoryModel>>((ref){
  final categories=ref.watch(categoriesControllerProvider.notifier);
  return categories.getJobCategories();
});
class CategoryController extends AsyncNotifier<AsyncValue<void>>{

  late CategoryRepository _categoryRepository;

  @override
  AsyncValue<void>build(){
    _categoryRepository=ref.watch(categoryRepositoryProvider);
    return const  AsyncValue.data(null);
  }

  Future<List<CategoryModel>>getJobCategories()async{
    final res=await _categoryRepository.getJobCategories();
    return switch(res){
      Left(value:final l)=>throw l.message,
      Right(value:final r)=>r
    };
  }
}