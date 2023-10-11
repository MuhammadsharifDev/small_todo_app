// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uacademy_samll_todo_app/bloc/main/main_bloc.dart';
import 'package:uacademy_samll_todo_app/core/localization/localization_page.dart';
import 'package:uacademy_samll_todo_app/data/local/local_db.dart';
import 'package:uacademy_samll_todo_app/data/models/todo_user.dart';
import 'package:uacademy_samll_todo_app/screnns/main_page/home/detail/description_page.dart';


class HomeScreen extends StatefulWidget {
  List<TodoFields> todoFields;

  HomeScreen({super.key, required this.todoFields});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _init() async {
    widget.todoFields = await LocalDatabase.getAllTodoFields();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Center(child: Text(LocaleLocalizations.of(context).tr('title1'),),),
            centerTitle: true,
            elevation: null,
          ),
          body: widget.todoFields.isEmpty
              ? Column(
            children: [
              const SizedBox(
                height: 84,
              ),
              Center(
                  child: SvgPicture.asset(
                      'assets/svg_picture/primaryPicture.svg')),
              const SizedBox(
                height: 10,
              ),
              //Text(LocaleLocalizations.of(context).tr('title'),),
               Text(LocaleLocalizations.of(context).tr('title2'),),
              const SizedBox(
                height: 10,
              ),
               Text(
                LocaleLocalizations.of(context).tr('title3'),
              ),
            ],
          )
              : ListView.builder(
            itemCount: widget.todoFields.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                        context, MaterialPageRoute(builder: (context) =>
                        DescriptionPage(todo: widget.todoFields[index])));
                    if (result != null && result == true) {
                      widget.todoFields =
                      await LocalDatabase.getAllTodoFields();
                      setState(() {});
                    }
                  },
                  child: Container(
                    width: 327,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(widget.todoFields[index].title),
                            subtitle: Text(widget.todoFields[index].time),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
