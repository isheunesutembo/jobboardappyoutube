import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_state.freezed.dart';

@freezed 
abstract class PaginationState<T> with _$PaginationState<T>{

  factory PaginationState({
    required List<T>data,
    bool? isLoadingMore,
    bool? hasNext,
    bool? isLoading,
    String? error,
    int? currentPage,

  })=_PaginationState;
}

