part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class LoadDataEvent extends HomeEvent {}

class LoadTagEvent extends HomeEvent {
  final List<String> ids;
  LoadTagEvent({required this.ids});
}
