


import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/core/pagination_state/pagination_state.dart';
import 'package:jobboardapp/features/vacancies/model/vacancy_model.dart';
import 'package:jobboardapp/features/vacancies/repository/vacancy_repository.dart';
import 'package:jobboardapp/util/util.dart';

final vacancyControllerProvider=AsyncNotifierProvider<VacancyController,PaginationState<VacancyModel>>(VacancyController.new);

final getVacanciesProvider=FutureProvider((ref){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);

  return vacancies.getVacancies(page: 1);
});

final searchQueryProvider=StateProvider<String>((ref)=>"");
final searchVacanciesProvider=FutureProvider<List<VacancyModel>>((ref)async{
  final vacancies=ref.watch(vacancyControllerProvider.notifier);
  final query=ref.watch(searchQueryProvider);

  if(query.isEmpty){
    return await vacancies.getVacancies(page: 1);
  }else{
    return await vacancies.searchVacancies( query);}

  
});

final getVacancyByIdprovider=FutureProvider.family((ref,String id){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);
  return vacancies.getVacancyById(id);
});

final getVacanciesByCategoryProvider=FutureProvider.family((ref,String categoryId){
  final vacancies=ref.watch(vacancyControllerProvider.notifier);

  return vacancies.getVacanciesByCategory(categoryId);
});
class VacancyController extends AsyncNotifier<PaginationState<VacancyModel>>{

  late VacancyRepository _vacancyRepository;
  int _page=1;
  int _limit=10;
  int _currentPage=0;
  List<VacancyModel>_allData=[];

   @override
  FutureOr<PaginationState<VacancyModel>>build()async{
    _vacancyRepository=ref.watch(vacancyRepositoryProvider);
    return await _fetchFirstPage();

  }

  Future<List<VacancyModel>>getVacancies({required int page})async{
    final res=await _vacancyRepository.getVacancies(page: page, limit: _limit);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }

  Future<PaginationState<VacancyModel>>_fetchFirstPage()async{
    try{
     _currentPage=1;
     _allData.clear();

     final vacancies=await getVacancies(page: _currentPage);
     _allData=List.from(vacancies);

     return PaginationState(data: _allData,
     isLoading: false,
     hasNext: vacancies.length==_limit,
     currentPage: _currentPage);
    }catch(e){
     final errorState=PaginationState(data: _allData,
     error: e.toString(),
     currentPage: _currentPage);
     state =AsyncError(e, StackTrace.current);
     return errorState;
    }
  }
  Future<void>refresh()async{
    final currentState=state.valueOrNull;
    if(currentState!=null){
      state=AsyncData(currentState.copyWith(isLoading: true));
    }else{
      state=const AsyncLoading();
    }

    try{
      _currentPage=1;
      _allData.clear();
      final vacancies=await getVacancies(page: _currentPage);
      _allData=List.from(vacancies);
      final newState=PaginationState(data: _allData,
      isLoading: false,
      hasNext: vacancies.length==_limit,
      currentPage: _currentPage);
      state=AsyncData(newState);

    }catch(error,stackTrace){
      state=AsyncError(error, stackTrace);
      
    }
  }

  Future<void>loadMore()async{
    if(state.value?.isLoadingMore==true||state.value?.hasNext==false){
      return;
    }
    state=AsyncData(state.value!.copyWith(isLoading: true));
    final nextPage=_page+1;

    final newVacancies=await getVacancies(page: nextPage);
    if(newVacancies.isNotEmpty){
      _page=nextPage;
    }
    state=AsyncData(state.value!.copyWith(
      data:[...state.value!.data,...newVacancies],
      isLoading: false,
      hasNext: newVacancies.length==_limit
    ));

  }
 Future<List<VacancyModel>>getVacanciesByCategory(String categoryId)async{
    final res=await _vacancyRepository.getVacanciesByCategory(categoryId: categoryId);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }

   Future<VacancyModel>getVacancyById(String id)async{
    final res=await _vacancyRepository.getVacancyById(id);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }

   Future<List<VacancyModel>>searchVacancies(String search)async{
    final res=await _vacancyRepository.searchVacancies(search);
    return switch(res){
      Left(value:final l)=>throw l,
      Right(value:final r)=>r
    };
  }

}