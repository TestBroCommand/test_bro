import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';

abstract interface class PBrepository {
  Future<List<QuizEntity>> getAllQuizzes();
  Future<List<QuizEntity>> getAllUQuizzes();

}
