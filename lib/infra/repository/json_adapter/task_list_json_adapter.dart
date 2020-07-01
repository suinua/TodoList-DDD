
import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/infra/repository/json_adapter/task_json_adapter.dart';

class TaskListJsonAdapter {
  static TaskList decode(Map<String, dynamic> json) {
    return TaskList(
        id: TaskListId(json['id']),
        title: json['title'],
        tasks: List<Map>.from(json['tasks'])
            .map((e) => Map<String, dynamic>.from(e))
            .map(TaskJsonAdapter.decode)
            .toList());
  }

  static Map<String, dynamic> encode(TaskList taskList) {
    return <String, dynamic>{
      'id': taskList.id.value,
      'title': taskList.title,
      'tasks': taskList.tasks.map(TaskJsonAdapter.encode).toList()
    };
  }
}
