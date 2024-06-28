import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';
import 'package:test_bro/src/feature/home/model/entities/tag_entity.dart';

abstract interface class PBrepository {
  Future<List<QuizEntity>> getAllQuizzes();
  Future<List<QuizEntity>> getAllUQuizzes();
  Future<List<TagEntity>> getTags();

  Future<List<QuizEntity>> getAllTagsByIds(List<String> ids);
}
