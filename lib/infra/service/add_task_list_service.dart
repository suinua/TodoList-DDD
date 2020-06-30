
import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/domain/repository/task_list_repository.dart';
import 'package:TodoList_DDD/domain/service/add_task_list_domain_service.dart';

class AddTaskListService extends AddTaskListDomainService {
  const AddTaskListService(TaskListRepository repository) : super(repository);

  @override
  void execute(TaskList taskList) {
    assert(repository.findById(taskList.id) == null);

    repository.add(taskList);
  }
}