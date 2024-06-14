import 'dart:async';

import 'package:sentry_flutter/sentry_flutter.dart' as s;
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:test_bro/src/core/utils/logger.dart';
import 'package:test_bro/src/feature/app/logic/app_runner.dart';

void main() async {
  //setPathUrlStrategy();

  try {
    Exception(TelegramWebApp.instance.initDataUnsafe!.start_param);
  } catch (exception, stackTrace) {
    await s.Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }
  logger.runLogging(
    () => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
  );
}
