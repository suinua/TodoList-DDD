import 'package:TodoList_DDD/domain/model/task.dart';

class TaskJsonAdapter {
  static Task decode(Map<String, dynamic> json) {
    return Task(
        id: TaskId(json['id']),
        text: json['text'],
        isDone: json['is_done']);
  }

  static Map<String, dynamic> encode(Task task) {
    return <String, dynamic>{
      'id': task.id.value,
      'text': task.text,
      'is_done': task.isDone,
    };
  }
}
