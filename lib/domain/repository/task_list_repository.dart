import 'package:TodoList_DDD/domain/model/task_list.dart';

abstract class TaskListRepository {
  const TaskListRepository();

  TaskList findById(TaskListId taskListId);
  List<TaskList> getAll();
  void add(TaskList taskList);
  void delete(TaskList taskList);
  void update(TaskList taskList);
}