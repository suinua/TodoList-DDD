import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/infra/repository/web_storage_task_list_repository.dart';
import 'package:TodoList_DDD/infra/service/add_task_list_service.dart';
import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';

class TaskListUsecaseService {
  static const WebStorageTaskListRepository _repository = WebStorageTaskListRepository();
  static const AddTaskListService _addTaskListService = AddTaskListService(_repository);

  const TaskListUsecaseService();

  TaskListDTO add(String title) {
    var taskList = TaskList.asNew(title: title);
    _addTaskListService.execute(taskList);

    return TaskListDTO(taskList);
  }

  void delete(TaskList taskList) {
    _repository.delete(taskList);
  }

  TaskListDTO findById(TaskListId taskListId) {
    var taskList = _repository.findById(taskListId);
    return TaskListDTO(taskList);
  }

  List<TaskListDTO> getAll() {
    return _repository.getAll().map((e) => TaskListDTO(e)).toList();
  }

  void update(TaskList taskList) {
    _repository.update(taskList);
  }
}
