import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repository.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';
import 'package:test_bro/src/feature/home/model/entities/tag_entity.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PBrepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadTagEvent>(_loadTag);
    on<LoadDataEvent>(_loadData);
    add(LoadDataEvent());
  }

  Future<void> _loadData(LoadDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final quizzes = await repository.getAllQuizzes();
      final uquizzes = await repository.getAllUQuizzes();
      final tags = await repository.getTags();
      final allQuizzes = [...quizzes, ...uquizzes];
      emit(HomeLoaded(allQuizzes, tags));
    } catch (e) {
      emit(HomeFailure(e));
    }
  }

  Future<void> _loadTag(LoadTagEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final quizzes = await repository.getAllTagsByIds(event.ids);
      final tags = await repository.getTags();
      emit(HomeLoadTag(quizzes, tags));
    } catch (e) {
      emit(HomeFailure(e));
    }
  }
}
