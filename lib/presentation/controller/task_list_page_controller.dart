import 'dart:html';

import 'package:TodoList_DDD/presentation/converter/task_list_html_converter.dart';
import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';
import 'package:TodoList_DDD/usecase/service/task_list_usecase_service.dart';

class TaskListPageController {
  final TaskListUsecaseService _service;

  const TaskListPageController() : _service = const TaskListUsecaseService();

  void resetNewTaskListTitleInput() {
    InputElement newTaskListTitleInputElement =
        querySelector('#newTaskListTitleInput');
    newTaskListTitleInputElement.value = '';
  }

  String getNewTaskListTitle() {
    InputElement newTaskListTitleInputElement =
        querySelector('#newTaskListTitleInput');
    return newTaskListTitleInputElement.value;
  }

  void removeAll() {
    //TODO
  }

  void loadAll() {
    _service.getAll().forEach(_addTaskList);
  }

  void addNewTaskList() {
    var title = getNewTaskListTitle();
    var newTaskList = _service.add(title);
    _addTaskList(newTaskList);
  }

  void _addTaskList(TaskListDTO taskList) {
    DivElement taskListArea = querySelector('#taskListArea');

    taskListArea.insertAdjacentElement(
        'beforeend', TaskListHtmlConverter.execute(taskList));
  }
}
