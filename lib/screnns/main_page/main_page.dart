import 'package:flutter/material.dart';
import 'package:uacademy_samll_todo_app/data/local/local_db.dart';
import 'package:uacademy_samll_todo_app/data/models/todo_user.dart';
import 'package:uacademy_samll_todo_app/screnns/main_page/home/add_todo/add_todo_page.dart';
import 'package:uacademy_samll_todo_app/screnns/main_page/home/home_page.dart';


import 'profile/profile_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ButtomMenu _buttomMenun = ButtomMenu.add;

  void _selectedTab(ButtomMenu tab) {
    setState(() {
      _buttomMenun = tab;
    });
  }

  List<TodoFields> myTodos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _buttomMenun.index,
        children: [
          HomeScreen(todoFields: myTodos),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _buttomMenun.index,
        onTap: (index) {
          _selectedTab(ButtomMenu.values[index]);
        },
        items:[
          BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () async {
                  final result = await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => AddTodoScreen(),
                  );
                  if (result != null && result == true) {

                    myTodos = await LocalDatabase.getAllTodoFields();
                    setState(() {});
                  }
                },
                icon: Icon(Icons.add),
              ),
              label: 'Add your task'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

enum ButtomMenu {
  add,
  profile,
}
