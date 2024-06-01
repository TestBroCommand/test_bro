part of 'quize_bloc.dart';

@immutable
sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizLoaded extends QuizState {
  final StartEntity startPage;
  final List<FinalEntity> finalPage;
  final List<PageEntity> pages;

  @override
  List<Object> get props => [startPage, finalPage, pages];
  const QuizLoaded(this.startPage, this.finalPage, this.pages);
}

final class QuizFailure extends QuizState {
  const QuizFailure(this.error);
  final Object error;

  @override
  List<Object> get props => [error];
}
