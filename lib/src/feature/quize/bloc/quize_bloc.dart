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
  String? startPageId;
  List<String>? finalPageId;
  List<String>? pagesId;

  QuizBloc(this.repository) : super(QuizInitial()) {
    emit(QuizLoading());
    on<LoadDataEvent>((event, emit) async {
      startPageId = event.startPageId;
      finalPageId = event.finalPageId;
      pagesId = event.pagesId;
      await _loadData(event, emit);
    });
    on<ResetStateEvent>((event, emit) async {
      await _resetState(event, emit);
    });
  }
  Future<void> _resetState(
    ResetStateEvent event,
    Emitter<QuizState> emit,
  ) async {
    emit(QuizLoading());
  }

  Future<void> _loadData(LoadDataEvent event, Emitter<QuizState> emit) async {
    try {
      final startPage = await repository.getStartPage(startPageId ?? "");
      final pages = await repository.getAllPages(pagesId ?? []);
      final resultPage = await repository.getAllFinalles(finalPageId ?? []);
      emit(QuizLoaded(startPage, resultPage, pages));
    } catch (e) {
      emit(QuizFailure(e));
    }
  }
}
