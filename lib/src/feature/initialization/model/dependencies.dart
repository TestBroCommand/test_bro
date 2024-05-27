import 'package:test_bro/src/feature/app/logic/tracking_manager.dart';
import 'package:test_bro/src/feature/home/bloc/home_bloc.dart';
import 'package:test_bro/src/feature/home/data/repository/pb_repository.dart';
import 'package:test_bro/src/feature/initialization/logic/composition_root.dart';
import 'package:test_bro/src/feature/settings/bloc/settings_bloc.dart';

/// {@template dependencies}
/// Composed dependencies from the [CompositionRoot].
///
/// This class is used to pass dependencies to the application.
///
/// {@macro composition_process}
/// {@endtemplate}
 base class Dependencies {
  /// {@macro dependencies}
  const Dependencies({
    required this.settingsBloc,
    required this.errorTrackingManager,
    required this.homeBloc,
  });

  /// [SettingsBloc] instance, used to manage theme and locale.
  final SettingsBloc settingsBloc;

  /// [HomeBloc] instance, used to manage home feature.
  final HomeBloc homeBloc;

  /// [ErrorTrackingManager] instance, used to report errors.
  final ErrorTrackingManager errorTrackingManager;

}

/// {@template composition_result}
/// Result of composition
///
/// {@macro composition_process}
/// {@endtemplate}
final class CompositionResult {
  /// {@macro composition_result}
  const CompositionResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$CompositionResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
