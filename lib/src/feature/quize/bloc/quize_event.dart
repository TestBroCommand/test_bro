part of 'quize_bloc.dart';

@immutable
sealed class QuizEvent {}

class LoadDataEvent extends QuizEvent {
  final String startPageId;
  final List<String> finalPageId;
  final List<String> pagesId;
  LoadDataEvent({
    required this.startPageId,
    required this.finalPageId,
    required this.pagesId,
  });
}

class ResetStateEvent extends QuizEvent {
  ResetStateEvent();
}
