import 'package:flutter/material.dart';
import 'package:uacademy_samll_todo_app/core/localization/localization_page.dart';
import 'package:uacademy_samll_todo_app/data/local/local_db.dart';
import 'package:uacademy_samll_todo_app/data/models/todo_user.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  FocusNode ageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: Text(
                    LocaleLocalizations.of(context).tr('title5'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: Text(
                    LocaleLocalizations.of(context).tr('title6'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: timeController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  label: Text(
                    LocaleLocalizations.of(context).tr('title7'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              IconButton(
                onPressed: () async {
                  await LocalDatabase.insertTodoFields(
                    TodoFields(
                      title: titleController.text,
                      description: descriptionController.text,
                      time: timeController.text,
                    ),
                  );
                  // timeCo;ntroller.clear();
                  // descriptionController.clear();
                  // titleController.clear()
                  Navigator.pop(context, true);
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
