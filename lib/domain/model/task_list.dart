import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../aggregate_root.dart';
import 'task.dart';

class TaskList extends AggregateRoot {
  final TaskListId id;
  final title;
  List<Task> _tasks;

  TaskList({@required this.id, @required this.title, @required List<Task> tasks})
      : _tasks = tasks,
        assert(id != null),
        assert(title != null),
        assert(tasks != null);

  TaskList.asNew({@required this.title})
      : id = TaskListId.asNew(),
        _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) => _tasks.add(task);

  void removeTask(TaskId id) => _tasks.removeWhere((element) => element.id == id);

  void updateTask(Task task) {
    _tasks = _tasks.map((e){
      if(e.id == task.id) e = task;
      return e;
    }).toList();
  }
}

class TaskListId {
  final String value;

  TaskListId(this.value) : assert(value != null);

  TaskListId.asNew() : value = Uuid().v4();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is TaskListId) {
      return value == other.value;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => value.hashCode;
}
