import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:major_craft_application/features/home/domain/usecases/add_recent_search_usecase.dart';
import 'package:major_craft_application/features/home/domain/usecases/get_recent_search_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getRecentSearchUsecase,
    this._addRecentSearchUsecase,
  ) : super(HomeInitial()) {
    on<GetRecentSearchEvent>(_onGetRecentSearch);
    on<AddRecentSearchEvent>(_onAddRecentSearch);
    on<ClearAllEvent>(_onClearAllEvent);
  }

  final GetRecentSearchUsecase _getRecentSearchUsecase;
  final AddRecentSearchUsecase _addRecentSearchUsecase;

  FutureOr<void> _onGetRecentSearch(
    GetRecentSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      GetRecentSearchState(
        recentSearches: await _getRecentSearchUsecase(
          GetRecentSearchParams(
            event.keyword,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _onAddRecentSearch(
    AddRecentSearchEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _addRecentSearchUsecase(
      AddRecentSearchParams(event.keyword),
    );
    emit(
      AddRecentSearchState(),
    );
  }

  FutureOr<void> _onClearAllEvent(
    ClearAllEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      ClearAllState(),
    );
  }
}
