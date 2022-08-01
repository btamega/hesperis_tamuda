import 'package:flag/flag.dart';
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
  static FlagsCode getFlag(String code) {
    switch (code) {
      case 'ar':
        return FlagsCode.MA;
      case 'fr':
        return FlagsCode.FR;
      case 'en':
      default:
        return FlagsCode.US;
    }
  }
}

