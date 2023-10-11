import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_samll_todo_app/bloc/main/main_bloc.dart';
import 'package:uacademy_samll_todo_app/screnns/main_page/main_page.dart';

final light = ThemeData(
  cardColor: Colors.white,
  primaryColor: const Color(0xFF2AA2C8),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF2AA2C8),
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.indigo,
    titleTextStyle: TextStyle(
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
          color: Colors.black,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white60,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor:  Colors.deepPurple,
  ),
indicatorColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return const Color(0xFF2AA2C8);
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.white;
        },
      ),
      fixedSize: MaterialStateProperty.resolveWith<Size>(
            (states) {
          return const Size.fromHeight(52);
        },
      ),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
);

final dark = ThemeData(
  cardColor: const Color(0xFF2A2A2A),
  scaffoldBackgroundColor: const Color(0xFF1F1F1F),
  primaryColor: const Color(0xFF2AA2C8),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF2AA2C8),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor:  Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
    ),
  ),
  indicatorColor: Colors.white,
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.blue;
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.white;
          }
          return Colors.white;
        },
      ),
      fixedSize: MaterialStateProperty.resolveWith<Size>(
            (states) {
          return const Size.fromHeight(52);
        },
      ),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode,
            theme: light,
            darkTheme: dark,
            home: MainPage(),
          );
        },
      ),
    );
  }
}

