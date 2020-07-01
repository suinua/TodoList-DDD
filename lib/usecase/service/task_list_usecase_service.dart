import 'package:TodoList_DDD/domain/model/task.dart';
import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/infra/repository/web_storage_task_list_repository.dart';
import 'package:TodoList_DDD/infra/service/add_task_list_service.dart';
import 'package:TodoList_DDD/usecase/dto/task_dto.dart';
import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';

class TaskListUsecaseService {
  static const WebStorageTaskListRepository _taskListRepository =
      WebStorageTaskListRepository();
  static const AddTaskListService _addTaskListService =
      AddTaskListService(_taskListRepository);

  const TaskListUsecaseService();

  TaskListDTO addNewTaskList(String title) {
    var taskList = TaskList.asNew(title: title);
    _addTaskListService.execute(taskList);

    return TaskListDTO(taskList);
  }

  void deleteTaskList(TaskList taskList) {
    _taskListRepository.delete(taskList);
  }

  TaskListDTO findTaskListById(TaskListId taskListId) {
    var taskList = _taskListRepository.findById(taskListId);
    return TaskListDTO(taskList);
  }

  List<TaskListDTO> getAllTaskList() {
    return _taskListRepository.getAll().map((e) => TaskListDTO(e)).toList();
  }

  void updateTaskList(TaskList taskList) {
    _taskListRepository.update(taskList);
  }

  TaskDTO addTask(String id, String text) {
    var newTask = Task.asNew(text: text);
    var taskList = _taskListRepository.findById(TaskListId(id));
    taskList.addTask(newTask);
    _taskListRepository.update(taskList);

    return TaskDTO(newTask);
  }

  void deleteTask(String parentId, String id) {
    var taskList = _taskListRepository.findById(TaskListId(parentId));
    taskList.removeTask(TaskId(id));
    _taskListRepository.update(taskList);
  }
}
