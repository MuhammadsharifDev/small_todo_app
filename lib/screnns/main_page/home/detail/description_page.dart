import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uacademy_samll_todo_app/data/local/local_db.dart';
import 'package:uacademy_samll_todo_app/data/models/todo_user.dart';

class DescriptionPage extends StatelessWidget {
  final TodoFields todo;


  const DescriptionPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),

            child: Padding(
              padding: const EdgeInsets.only(left: 23,right: 20,top: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:12 ,),
                  ListTile(
                    title: Text(todo.title),
                  ),
                  const SizedBox(height: 20,),
                  Text(todo.description),
                  const SizedBox(height: 25,),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg_picture/edit_icon'),
                        const SizedBox(width: 20,),
                        GestureDetector(
                            onTap: ()async{

                            },
                            child: const Text('Edit Task')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset('assets/svg_picture/delete_icon'),
                      ),
                      const SizedBox(width: 5,),
                      GestureDetector(
                          onTap: ()async{
                            LocalDatabase.deleteTodoFieldsById(todo.id!);
                            Navigator.pop(context,true);

                          },
                          child: Text('Delete task',style: TextStyle(color: Colors.red),))
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
