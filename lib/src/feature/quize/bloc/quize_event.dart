// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quize_bloc.dart';

@immutable
sealed class QuizEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDataEvent extends QuizEvent {
  final String id;
  final String isUQuiz;
  LoadDataEvent({
    required this.id,
    required this.isUQuiz,
  });

  @override
  List<Object> get props => [
        id,
        isUQuiz,
      ];
}

class ResetStateEvent extends QuizEvent {
  ResetStateEvent();
}

class AnswerSelected extends QuizEvent {
  final int questionIndex;
  final int answerIndex;

  AnswerSelected(
    this.questionIndex,
    this.answerIndex,
  );

  @override
  List<Object> get props => [questionIndex, answerIndex];
}

class QuizCompletedEvent extends QuizEvent {}

class UpdateCompleteFieldEvent extends QuizEvent {
  final String quizId;
  UpdateCompleteFieldEvent({
    required this.quizId,
  });

  @override
  List<Object> get props => [quizId];
}
