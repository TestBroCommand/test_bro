import 'package:flutter/material.dart';

CheckboxTheme mainCheckboxTheme(Widget child) {
  return CheckboxTheme(
      data: CheckboxThemeData(
          checkColor: WidgetStatePropertyAll(Colors.white),
          fillColor: WidgetStatePropertyAll(Color.fromRGBO(0, 122, 255, 1))),
      child: child);
}
