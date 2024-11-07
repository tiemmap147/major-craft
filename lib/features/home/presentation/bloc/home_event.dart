part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetRecentSearchEvent extends HomeEvent {
  const GetRecentSearchEvent({
    required this.keyword,
  });
  final String keyword;
}

class AddRecentSearchEvent extends HomeEvent {
  const AddRecentSearchEvent({
    required this.keyword,
  });
  final String keyword;
}

class ClearAllEvent extends HomeEvent {}
