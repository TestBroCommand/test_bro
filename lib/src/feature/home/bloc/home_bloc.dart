import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repository.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PBrepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadDataEvent>(_loadData);
    add(LoadDataEvent());
  }

  Future<void> _loadData(LoadDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final quizzes = await repository.getAllQuizzes();
      emit(HomeLoaded(quizzes));
    } catch (e) {
      emit(HomeFailure(e));
    }
  }
}
