import 'package:TodoList_DDD/domain/model/task.dart';

class TaskDTO {
  final String id;
  final String text;
  final bool isDone;

  TaskDTO(Task task)
      : id = task.id.value,
        text = task.text,
        isDone = task.isDone;
}
