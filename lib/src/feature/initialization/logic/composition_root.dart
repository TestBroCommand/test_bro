import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bro/src/core/constant/config.dart';
import 'package:test_bro/src/core/utils/logger.dart';
import 'package:test_bro/src/feature/app/logic/tracking_manager.dart';
import 'package:test_bro/src/feature/home/bloc/home_bloc.dart';
import 'package:test_bro/src/feature/home/data/data_source/pb_dataSource.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repository.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repositoryImpl.dart';
import 'package:test_bro/src/feature/initialization/model/dependencies.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';
import 'package:test_bro/src/feature/quize/data/data_source/pb_dataSource.dart'
    as quiz;
import 'package:test_bro/src/feature/quize/data/repository/pb_repositoryImpl.dart'
    as quizRepoImpl;
import 'package:test_bro/src/feature/quize/data/repository/pb_respository.dart'
    as quizRepository;
import 'package:test_bro/src/feature/settings/bloc/settings_bloc.dart';
import 'package:test_bro/src/feature/settings/data/locale_datasource.dart';
import 'package:test_bro/src/feature/settings/data/locale_repository.dart';
import 'package:test_bro/src/feature/settings/data/theme_datasource.dart';
import 'package:test_bro/src/feature/settings/data/theme_mode_codec.dart';
import 'package:test_bro/src/feature/settings/data/theme_repository.dart';

/// {@template composition_root}
/// A place where all dependencies are initialized.
/// {@endtemplate}
///
/// {@template composition_process}
/// Composition of dependencies is a process of creating and configuring
/// instances of classes that are required for the application to work.
///
/// It is a good practice to keep all dependencies in one place to make it
/// easier to manage them and to ensure that they are initialized only once.
/// {@endtemplate}
final class CompositionRoot {
  /// {@macro composition_root}
  const CompositionRoot(this.config);

  /// Application configuration
  final Config config;

  /// Composes dependencies and returns result of composition.
  Future<CompositionResult> compose() async {
    final stopwatch = Stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies
    final dependencies = await _initDependencies();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = CompositionResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }

  Future<Dependencies> _initDependencies() async {
    final errorTrackingManager = await _initErrorTrackingManager();
    final sharedPreferences = await SharedPreferences.getInstance();
    final settingsBloc = await _initSettingsBloc(sharedPreferences);
    final homeBloc = await _initHomeBloc();
    final quizBloc = await _initQuizBloc();
    return Dependencies(
      settingsBloc: settingsBloc,
      errorTrackingManager: errorTrackingManager,
      homeBloc: homeBloc,
      quizBloc: quizBloc,
    );
  }

  Future<PBrepository> _initPBRepository() async {
    final dataSource = PBdataSource();
    return PBrepositoryImpl(dataSource: dataSource);
  }

  Future<quizRepository.PBrepository> _initPBRepositoryQuiz() async {
    final dataSource = quiz.PBdataSource();
    return quizRepoImpl.PBrepositoryImpl(dataSource: dataSource);
  }

  Future<HomeBloc> _initHomeBloc() async {
    final pbRepository = await _initPBRepository();
    return HomeBloc(pbRepository);
  }

  Future<QuizBloc> _initQuizBloc() async {
    final pbRepository = await _initPBRepositoryQuiz();
    return QuizBloc(pbRepository);
  }

  Future<ErrorTrackingManager> _initErrorTrackingManager() async {
    final errorTrackingManager = SentryTrackingManager(
      logger,
      sentryDsn: config.sentryDsn,
      environment: config.environment.value,
    );

    if (config.enableSentry) {
      await errorTrackingManager.enableReporting();
    }

    return errorTrackingManager;
  }

  Future<SettingsBloc> _initSettingsBloc(SharedPreferences prefs) async {
    final localeRepository = LocaleRepositoryImpl(
      localeDataSource: LocaleDataSourceLocal(sharedPreferences: prefs),
    );

    final themeRepository = ThemeRepositoryImpl(
      themeDataSource: ThemeDataSourceLocal(
        sharedPreferences: prefs,
        codec: const ThemeModeCodec(),
      ),
    );

    final localeFuture = localeRepository.getLocale();
    final theme = await themeRepository.getTheme();
    final locale = await localeFuture;

    final initialState = SettingsState.idle(appTheme: theme, locale: locale);

    final settingsBloc = SettingsBloc(
      localeRepository: localeRepository,
      themeRepository: themeRepository,
      initialState: initialState,
    );
    return settingsBloc;
  }
}
