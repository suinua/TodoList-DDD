import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../entity.dart';

class Task extends Entity {
  final TaskId id;
  final String text;
  final bool isDone;

  Task(
      {@required this.id, @required this.text, @required this.isDone})
      : assert(id != null),
        assert(text != null),
        assert(isDone != null);

  Task.asNew({@required this.text})
      : id = TaskId.asNew(),
        isDone = false;
}

class TaskId {
  final String value;

  TaskId(this.value) : assert(value != null);

  TaskId.asNew() : value = Uuid().v4();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other is TaskId) {
      return value == other.value;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => value.hashCode;
}
