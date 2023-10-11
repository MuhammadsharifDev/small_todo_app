part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class ThemeChangeEvent extends MainEvent{
  ThemeChangeEvent({
    required this.themeMode,
  });

  final ThemeMode themeMode;
}
