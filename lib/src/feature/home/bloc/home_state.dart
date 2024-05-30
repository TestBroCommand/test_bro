part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<QuizEntity> quizzes;

  const HomeLoaded(this.quizzes);

  @override
  List<Object> get props => [quizzes];
}

final class HomeFailure extends HomeState {
  const HomeFailure(this.error);
  final Object error;

  @override
  List<Object> get props => [error];
}
