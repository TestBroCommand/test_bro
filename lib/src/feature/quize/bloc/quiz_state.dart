part of 'quize_bloc.dart';

@immutable
abstract class QuizState extends Equatable {
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
  final Map<int, int> answers;

  @override
  List<Object> get props => [startPage, finalPage, pages, answers];

  const QuizLoaded({
    required this.startPage,
    required this.finalPage,
    required this.pages,
    required this.answers,
  });

  QuizLoaded copyWith({
    StartEntity? startPage,
    List<FinalEntity>? finalPage,
    List<PageEntity>? pages,
    Map<int, int>? answers,
  }) =>
      QuizLoaded(
        startPage: startPage ?? this.startPage,
        finalPage: finalPage ?? this.finalPage,
        pages: pages ?? this.pages,
        answers: answers ?? this.answers,
      );
}

final class QuizFailure extends QuizState {
  const QuizFailure(this.error);
  final Object error;

  @override
  List<Object> get props => [error];
}

final class QuizCompleted extends QuizState {
  final FinalPageQuiz finalpage;

  const QuizCompleted({required this.finalpage});
  @override
  List<Object> get props => [finalpage];
}
