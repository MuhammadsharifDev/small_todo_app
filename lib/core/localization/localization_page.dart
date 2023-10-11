
import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';



class LocaleLocalizations {
  LocaleLocalizations(this.locale);

  final Locale locale;

  static LocaleLocalizations of(BuildContext context) {
    return Localizations.of<LocaleLocalizations>(context, LocaleLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'title': 'Theme',
      'title1': 'My ToDo',
      'title2': 'What do you want to do today',
      'title3': 'Tap + to add your tasks',
      'title4': 'Language',
      'title5': 'title',
      'title6': 'description',
      'title7': 'time',


    },
    'uz': {
      'title': 'Mavzu',
      'title1': 'Menig Vazifalarim',
      'title2': 'Bugun nima qilsihni xoxlaysiz',
      'title3': 'Bosing+ vazifalaringizni qo\'shing',
      'title4': 'Til',
      'title5': 'sarlavha',
      'title6': 'tasvirlang',
      'title7': 'vaqt',
    },
  };

  static List<String> languages ()=> _localizedValues.keys.toList();

  String tr(String value){
    return _localizedValues[locale.languageCode]?[value]??'*$value';
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<LocaleLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => LocaleLocalizations.languages().contains(locale.languageCode);


  @override
  Future<LocaleLocalizations> load(Locale locale) {
    return SynchronousFuture<LocaleLocalizations>(LocaleLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}