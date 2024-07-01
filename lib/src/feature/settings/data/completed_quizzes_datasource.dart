
import 'package:test_bro/src/core/utils/preferences_dao.dart';

/// {@template locale_datasource}
/// [CompletedQuizzesDatasource] this is the entry point to the data level 
/// on the number of quizzes completed by the user.
///
/// This is used to set and get number of quizzes completed by the user.
/// {@endtemplate}
abstract interface class CompletedQuizzesDatasource {
  /// Get completed quizzes
  Future<int> getCompletedQuizzes();

  /// Set completed quizzes
  Future<void> setCompletedQuizzes(int completedQuiz);
}
/// {@macro completed_quizzes_datasource}
final class CompletedQuizzesDatasourceLocal extends PreferencesDao
  implements CompletedQuizzesDatasource {
  /// {@macro completed_quizzes_datasource}
  const CompletedQuizzesDatasourceLocal({required super.sharedPreferences});

  PreferencesEntry<int> get _completedQuizzes => intEntry('completedQuizzes');
  
  @override
  Future<int> getCompletedQuizzes() async{
    final completedQuiz = _completedQuizzes.read();
    return Future.value(completedQuiz ?? 0);
  }
  
  @override
  Future<void> setCompletedQuizzes(int newCompletedQuiz) async{
    await _completedQuizzes.set(newCompletedQuiz);
  }
}