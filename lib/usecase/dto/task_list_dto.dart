import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/usecase/dto/task_dto.dart';

class TaskListDTO {
  final String id;
  final String title;
  final List<TaskDTO> tasks;

  TaskListDTO(TaskList taskList)
      : id = taskList.id.value,
        title = taskList.title,
        tasks = taskList.tasks
            .map((e) => TaskDTO(e))
            .toList();
}
