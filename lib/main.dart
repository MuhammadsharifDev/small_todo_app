import 'package:flutter/material.dart';
import 'screnns/homescreen/bottom_navigator/bottom_navigator.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home:BottomNavigationPage(),
    );
  }
}

