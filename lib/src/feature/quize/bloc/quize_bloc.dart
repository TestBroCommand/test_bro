import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bro/src/feature/quize/data/repository/pb_respository.dart';
import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';

part 'quize_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  PBrepository repository;
  String? id;
  String? startPageId;
  List<String>? finalPageId;
  List<String>? pagesId;

  QuizBloc(this.repository) : super(QuizInitial()) {
    emit(QuizLoading());
    on<LoadDataEvent>((event, emit) async {
      id = event.id;
      await _loadData(event, emit);
    });
    on<ResetStateEvent>((event, emit) async {
      await _resetState(event, emit);
    });
    on<AnswerSelected>((event, emit) async {
      await _selectAnswer(event, emit);
    });
    on<QuizCompletedEvent>((event, emit) async {
      await _generateFinalScreen(event, emit);
    });
    on<UpdateCompleteFieldEvent>((event, emit) async {
      await _updateTakers(event, emit);
    });
  }

  Future<void> _generateFinalScreen(
    QuizCompletedEvent event,
    Emitter<QuizState> emit,
  ) async {
    if (state is QuizLoaded) {
      final loadedState = state as QuizLoaded;
      final answers = loadedState.answers;
      final finalsEntities = loadedState.finalPage;
      final finalPageEntity = _determineFinalPage(
        finalEntities: finalsEntities,
        answers: answers,
      );
      emit(
        QuizCompleted(
          finalpage: finalPageEntity,
        ),
      );
    }
  }

  Future<void> _loadData(LoadDataEvent event, Emitter<QuizState> emit) async {
    try {
      final startPage = await repository.getStartPage(id ?? "");
      final pages = await repository.getAllPages(id ?? "");
      final resultPages = await repository.getAllFinalles(id ?? "");
      emit(
        QuizLoaded(
          startPage: startPage,
          finalPage: resultPages,
          pages: pages,
          answers: const {},
        ),
      );
    } catch (e) {
      emit(QuizFailure(e));
    }
  }

  Future<void> _resetState(
    ResetStateEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(QuizLoading());
  }

  Future<void> _selectAnswer(
    AnswerSelected event,
    Emitter<QuizState> emit,
  ) async {
    try {
      if (state is QuizLoaded) {
        final loadedState = state as QuizLoaded;
        final updatedAnswers = Map<int, int>.from(loadedState.answers)
          ..[event.questionIndex] = event.answerIndex;
        emit(
          QuizLoaded(
            startPage: loadedState.startPage,
            finalPage: loadedState.finalPage,
            pages: loadedState.pages,
            answers: updatedAnswers,
          ),
        );
      }
    } catch (e) {
      emit(QuizFailure(e.toString()));
    }
  }

  Future<void> _updateTakers(
    UpdateCompleteFieldEvent event,
    Emitter<QuizState> emit,
  ) async {
    try {
      await repository.updateTakers(event.quizId);
    } catch (e) {
      emit(QuizFailure(e.toString()));
    }
  }

  FinalEntity _determineFinalPage({
    required List<FinalEntity> finalEntities,
    required Map<int, int> answers,
  }) {
    final Map<int, int> valueCounts = {};

    for (final value in answers.values) {
      if (valueCounts.containsKey(value)) {
        valueCounts[value] = valueCounts[value]! + 1;
      } else {
        valueCounts[value] = 1;
      }
    }
    int mostFrequentValue = valueCounts.keys.first;
    int maxCount = valueCounts[mostFrequentValue]!;

    valueCounts.forEach((key, count) {
      if (count > maxCount) {
        mostFrequentValue = key;
        maxCount = count;
      }
    });

    final finalPage = finalEntities.firstWhere(
      (finalpage) => finalpage.mostFrequentDigit == mostFrequentValue,
      orElse: () => finalEntities.first,
    );
    return finalPage;
  }
}
