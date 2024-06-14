import 'dart:async';

import 'package:test_bro/src/core/utils/logger.dart';
import 'package:test_bro/src/feature/app/logic/app_runner.dart';

void main() {
  //setPathUrlStrategy();
  logger.runLogging(
    () => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
  );
}
