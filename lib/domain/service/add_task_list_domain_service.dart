import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/domain/repository/task_list_repository.dart';

abstract class AddTaskListDomainService {
  final TaskListRepository repository;

  const AddTaskListDomainService(this.repository);

  void execute(TaskList taskList);
}