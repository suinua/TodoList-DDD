import 'dart:html';

import 'package:TodoList_DDD/presentation/controller/task_list_page_controller.dart';

class TaskListPageListener {
  final TaskListPageController _controller = const TaskListPageController();

  TaskListPageListener() {
    querySelector('#addTaskListButton').onClick.listen(onClickAddTaskListButton);
    window.onContentLoaded.listen(onLoad);
  }

  void onLoad(_) {
    _controller.loadAll();
  }

  void onClickAddTaskListButton(_) {
    _controller.addNewTaskList();
    _controller.resetNewTaskListTitleInput();
  }
}