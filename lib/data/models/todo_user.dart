const String userTable = "todo_user";

class ToDoSimple {
  static final List<String> values = [
    id,
    title,
    description,
    time,
  ];
  static const String id = "_id";
  static const String description = "description";
  static const String title = "title";
  static const String time = 'time';
}

class TodoFields {
  final int? id;
  final String title;
  final String description;
  final String time;

  TodoFields({
    this.id,
    required this.description,
    required this.time,
    required this.title,
  });

  TodoFields copyWith({
    int? id,
    String? title,
    String? description,
    String? time,
  }) =>
      TodoFields(
          id: id ?? this.id,
          description: description ?? this.description,
          title: title ?? this.title,
          time: time ?? this.time);

  static TodoFields fromJson(Map<String, dynamic> json) => TodoFields(
        id: json[ToDoSimple.id] as int?,
        description: json[ToDoSimple.description] as String,
        title: json[ToDoSimple.title] as String,
        time: json[ToDoSimple.time] as String,
      );

  Map<String, dynamic> toJson() => {
        ToDoSimple.id: id,
        ToDoSimple.description: description,
        ToDoSimple.title: title,
        ToDoSimple.time: time,
      };
}
