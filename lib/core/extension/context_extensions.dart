import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

extension ContextExtensions on BuildContext {
  Future<Object?> navNamedTo(String name, {Object? args}) {
    return Navigator.pushNamed(this, name, arguments: args);
  }

  Future<Object?> navReplaceNamedTo(String name, {Object? args}) {
    return Navigator.pushReplacementNamed(this, name, arguments: args);
  }

  Object? getArgs() {
    return ModalRoute.of(this)?.settings.arguments;
  }

  pop([Object? args]) {
    Navigator.pop(this, [args]);
  }

  removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  String translate(String key) {
    return AppLocalizations.of(this)?.translate(key) ?? '';
  }
}
