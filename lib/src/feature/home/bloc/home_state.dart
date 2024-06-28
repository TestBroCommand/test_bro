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
  final List<TagEntity> tags;

  const HomeLoaded(this.quizzes, this.tags);

  @override
  List<Object> get props => [quizzes];
}

final class HomeLoadTag extends HomeState {
  final List<TagEntity> tags;
  final List<QuizEntity> quizzes;

  const HomeLoadTag(this.quizzes, this.tags);

  @override
  List<Object> get props => [quizzes];
}

final class HomeFailure extends HomeState {
  const HomeFailure(this.error);
  final Object error;

  @override
  List<Object> get props => [error];
}
