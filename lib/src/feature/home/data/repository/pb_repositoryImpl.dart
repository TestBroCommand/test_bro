import 'package:test_bro/src/feature/home/data/data_source/pb_dataSource.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repository.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';
import 'package:test_bro/src/feature/home/model/entities/tag_entity.dart';

class PBrepositoryImpl implements PBrepository {
  final PBdataSource dataSource;

  const PBrepositoryImpl({required this.dataSource});

  @override
  Future<List<QuizEntity>> getAllQuizzes() async {
    final quizDTOs = await dataSource.getAllQuizes();
    final quizzes = quizDTOs.map(QuizEntity.fromDto).toList();
    return quizzes;
  }

  @override
  Future<List<QuizEntity>> getAllUQuizzes() async {
    final uquizDTOs = await dataSource.getAllUQuizes();
    final uquzzes =
        uquizDTOs.map((dto) => QuizEntity.fromDto(dto, isUquiz: true)).toList();
    return uquzzes;
  }

  @override
  Future<List<TagEntity>> getTags() async {
    final tagDtos = await dataSource.getAllTagsSource();
    final tag = tagDtos.map(TagEntity.fromDto).toList();
    return tag;
  }

  @override
  Future<List<QuizEntity>> getAllTagsByIds(List<String> ids) async {
    final quizDtos = await dataSource.getAllUQuizesByIds(ids);
    final quizzes =
        quizDtos.map((dto) => QuizEntity.fromDto(dto, isUquiz: true)).toList();
    return quizzes;
  }
}
