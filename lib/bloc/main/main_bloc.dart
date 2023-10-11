import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc()
      : super(
          const MainState(
            themeMode: ThemeMode.system,
            locale: Locale('en'),
          ),
        ) {
    on<ThemeChangeEvent>(onChangedTheme);
    on<LocaleChangedEvent>(onChangedLocale);
  }

  onChangedTheme(ThemeChangeEvent event, Emitter<MainState> emit) {
    emit(
      state.copyWith(themeMode: event.themeMode),
    );
  }

  onChangedLocale(LocaleChangedEvent event,Emitter<MainState> emit){
    emit(state.copyWith(locale: event.locale),);
  }
}
