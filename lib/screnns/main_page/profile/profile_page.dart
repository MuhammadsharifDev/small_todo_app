import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uacademy_samll_todo_app/bloc/main/main_bloc.dart';
import 'package:uacademy_samll_todo_app/core/localization/localization_page.dart';

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
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(LocaleLocalizations.of(context).tr('title'),),
                Spacer(),
                BlocBuilder<MainBloc, MainState>(
                  builder: (context, state) {
                    return Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        context.read<MainBloc>().add(
                          ThemeChangeEvent(
                              themeMode:
                              value ? ThemeMode.dark : ThemeMode.light),
                        );
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(LocaleLocalizations.of(context).tr('title4'),),
                const Spacer(),
                BlocBuilder<MainBloc, MainState>(
                  buildWhen: (previous, current) => previous.locale != current.locale,
                  builder: (context, state) {
                    return Switch(
                      value: state.locale == const Locale('en'),
                      onChanged: (value) {
                        context.read<MainBloc>()
                            .add(
                          LocaleChangedEvent(
                            locale: value ? const Locale('en') : const Locale('uz'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
