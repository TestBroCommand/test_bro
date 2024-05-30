import 'package:flutter/material.dart';

bool isCupertino(BuildContext context) {
  if (Theme.of(context).platform == TargetPlatform.iOS ||
      Theme.of(context).platform == TargetPlatform.macOS) {
    return true;
  } else {
    return false;
  }
}
