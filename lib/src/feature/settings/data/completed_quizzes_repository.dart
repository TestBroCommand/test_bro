import 'package:test_bro/src/feature/settings/data/completed_quizzes_datasource.dart';

///A repository of completed quizzes that stores and retrieves 
///information about user-completed quizzes
abstract interface class CompletedQuizzesRepository {
  /// Get completed quizzes
  Future<int> getCompletedQuizzes();

  /// Set completed quizzes
  Future<void> setCompletedQuizzes(int completedQuiz);
}

///CompletedQuizzes repository implementation
final class CompletedQuizzesRepositoryImpl implements CompletedQuizzesRepository{
  /// Create CompletedQuizzes repository
  const CompletedQuizzesRepositoryImpl({required CompletedQuizzesDatasource completedQuizzesDatasource})
  : _completedQuizzesDatasource = completedQuizzesDatasource;

  final CompletedQuizzesDatasource _completedQuizzesDatasource;
  
  @override
  Future<int> getCompletedQuizzes() => 
    _completedQuizzesDatasource.getCompletedQuizzes();
  
  @override
  Future<void> setCompletedQuizzes(int completedQuiz) => 
    _completedQuizzesDatasource.setCompletedQuizzes(completedQuiz);
}