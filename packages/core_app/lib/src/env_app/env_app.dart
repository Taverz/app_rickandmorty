import 'package:core_app/src/env_app/env_preference.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'env_app_state.dart';
import 'env_app_model.dart';

part  'env_app_extensions.dart';


class EnvManager {
  final _stateSubject = BehaviorSubject<EnvState>.seeded(const EnvState());
  final PreferencesManager _preferencesManager = PreferencesManager();

  Stream<EnvState> get stateStream => _stateSubject.stream;
  EnvState get currentState => _stateSubject.value;

  Future<void> onStart() async {
    final localeString = await _preferencesManager.getLocale();
    final themeString = await _preferencesManager.getTheme();

    if (localeString != null && themeString != null) {
      final envModel = EnvModel(
        locale: localeString,
        theme: themeString,
      );
      _stateSubject.add(
        EnvState(
          locale: envModel.locale.getLocale,
          themeMode: envModel.theme.getThemeMode,
        ),
      );
    }
  }

  Future<void> _save({LocaleEnum? locale, ThemeMode? themeMode}) async {
    final envModel = EnvModel(
      locale:
          locale != null ? locale.asString() : currentState.locale.asString(),
      theme: themeMode != null
          ? themeMode.asString()
          : currentState.themeMode.asString(),
    );

    await _preferencesManager.setLocale(envModel.locale);
    await _preferencesManager.setTheme(envModel.theme);
  }

  void setLightTheme() {
    _save(themeMode: ThemeMode.light);
    _stateSubject.add(currentState.copyWith(themeMode: ThemeMode.light));
  }

  void setDarkTheme() {
    _save(themeMode: ThemeMode.dark);
    _stateSubject.add(currentState.copyWith(themeMode: ThemeMode.dark));
  }

  void switchTheme() {
    final themeMode = currentState.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    _save(themeMode: themeMode);
    _stateSubject.add(currentState.copyWith(themeMode: themeMode));
  }

  ThemeMode getThemeMode() {
    return currentState.themeMode;
  }

  void setRuLocale() {
    _save(locale: LocaleEnum.ru);
    _stateSubject.add(currentState.copyWith(locale: LocaleEnum.ru));
  }

  void setEnLocale() {
    _save(locale: LocaleEnum.en);
    _stateSubject.add(currentState.copyWith(locale: LocaleEnum.en));
  }

  void setLocale({required LocaleEnum locale}) {
    _save(locale: locale);
    _stateSubject.add(currentState.copyWith(locale: locale));
  }

  LocaleEnum getLocale() {
    return currentState.locale;
  }

  void dispose() {
    _stateSubject.close();
  }
}
