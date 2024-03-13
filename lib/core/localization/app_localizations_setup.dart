import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization.dart';

class AppLocalizationSetup {
  static Iterable<Locale> supportedLocales = appLanguages.map((e) => Locale(e)).toList();

  static const Iterable<String> appLanguages = [
    'en',
    'ar',
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegate = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(Locale? locale, Iterable<Locale> supportedLocales) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
