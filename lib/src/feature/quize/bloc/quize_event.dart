// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quize_bloc.dart';

@immutable
sealed class QuizEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDataEvent extends QuizEvent {
  final String id;
  LoadDataEvent({required this.id});

  @override
  List<Object> get props => [
        id,
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
