import 'package:test_bro/src/feature/initialization/model/environment.dart';

/// Application configuration
class Config {
  /// Creates a new [Config] instance.
  const Config();

  /// The current environment.
  Environment get environment {
    var environment = const String.fromEnvironment('ENVIRONMENT');

    if (environment.isNotEmpty) {
      return Environment.from(environment);
    }

    environment = const String.fromEnvironment('FLUTTER_APP_FLAVOR');

    return Environment.from(environment);
  }

  String get pbEmail => 'uohucku3ne@mail.authpass.app';
  String get pbPass => "'PIGwYyX@VDw)rM~7feT)VG\$pntQTrhwkLq432ad";

  /// The Sentry DSN.
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');

  /// Whether Sentry is enabled.
  bool get enableSentry => sentryDsn.isNotEmpty;
}
