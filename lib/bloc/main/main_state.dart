part of 'main_bloc.dart';

@immutable
class MainState extends Equatable{
  final ThemeMode themeMode;
  const MainState({required this.themeMode});


  MainState copyWith({ThemeMode? themeMode}){
    return MainState(themeMode: themeMode??this.themeMode);
  }

  @override
  List<Object?> get props => [themeMode];

}
