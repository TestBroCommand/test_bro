import 'dart:async';

import 'package:test_bro/src/core/utils/logger.dart';
import 'package:test_bro/src/feature/app/logic/app_runner.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
 // setPathUrlStrategy();
  logger.runLogging(
    () => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    ),
  );
}
