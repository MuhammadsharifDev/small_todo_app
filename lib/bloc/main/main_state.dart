part of 'main_bloc.dart';

@immutable
class MainState extends Equatable{
  final ThemeMode themeMode;

  final Locale locale;
  const MainState({required this.themeMode,required this.locale});


  MainState copyWith({ThemeMode? themeMode,Locale? locale}){
    return MainState(themeMode: themeMode??this.themeMode,locale: locale??this.locale);
  }

  @override
  List<Object?> get props => [themeMode,locale];

}
