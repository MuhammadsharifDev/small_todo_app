import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_samll_todo_app/bloc/main/main_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Switch(
              value: isSwitched,
              onChanged: (value) {
                context.read<MainBloc>()
                    .add(
                  ThemeChangeEvent(
                      themeMode: value ? ThemeMode.dark : ThemeMode.light),
                );
                setState(() {
                  isSwitched = value;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
