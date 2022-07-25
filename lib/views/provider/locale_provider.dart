import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('fr');
  Locale  get locale =>_locale;
  void setLocale(Locale locale){
    _locale = locale;
    notifyListeners();
  }
  void clearLocale(){
    _locale= null as Locale;
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('fr'),
  ];
  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return 'MA';
      case 'fr':
        return 'FR';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}

