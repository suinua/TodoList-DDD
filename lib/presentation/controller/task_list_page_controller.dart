import 'dart:html';

import 'package:TodoList_DDD/domain/model/task.dart';
import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/presentation/converter/task_html_converter.dart';
import 'package:TodoList_DDD/presentation/converter/task_list_html_converter.dart';
import 'package:TodoList_DDD/usecase/dto/task_dto.dart';
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

  String _getNewTaskListTitle() {
    InputElement newTaskListTitleInputElement =
        querySelector('#newTaskListTitleInput');
    return newTaskListTitleInputElement.value;
  }

  void removeAll() {
    DivElement taskListArea = querySelector('#taskListArea');
    taskListArea.children = [];
  }

  void loadAll() {
    _service.getAllTaskList().forEach(_addTaskList);
  }

  void addNewTaskList() {
    var title = _getNewTaskListTitle();
    var newTaskList = _service.addNewTaskList(title);
    _addTaskList(newTaskList);
  }

  void _addTaskList(TaskListDTO taskList) {
    DivElement taskListArea = querySelector('#taskListArea');
    DivElement taskListHtmlElement = TaskListHtmlConverter.execute(taskList);
    taskListArea.insertAdjacentElement('beforeend', taskListHtmlElement);

    querySelector('#${TaskListHtmlClassName.addTaskButton + taskList.id}')
        .onClick
        .listen((_) {
      addNewTask(taskList.id);
    });

    taskList.tasks.forEach((element) => _addTask(taskList.id, element));
  }

  void resetNewTaskTextInput() {
    InputElement newTaskTextInputElement =
        querySelector('#${TaskListHtmlClassName.newTaskTextInput}');
    newTaskTextInputElement.value = '';
  }

  String _getNewTaskText(String id) {
    InputElement newTaskTextInputElement =
        querySelector('#${TaskListHtmlClassName.newTaskTextInput + id}');
    return newTaskTextInputElement.value;
  }

  void addNewTask(String id) {
    var text = _getNewTaskText(id);
    var task = _service.addTask(TaskListId(id), text);

    _addTask(id, task);
  }

  void _addTask(String parentId, TaskDTO task) {
    DivElement tasksArea =
        querySelector('#${TaskListHtmlClassName.tasks + parentId}');

    tasksArea.insertAdjacentElement(
        'beforeend', TaskHtmlConverter.execute(task));

    querySelector('#${TaskHtmlClassName.deleteButton + task.id}')
        .onClick
        .listen((_) {
      _deleteTask(parentId, task.id);
    });
  }

  void _deleteTask(String parentId, String id) {
    _service.deleteTask(TaskListId(parentId), TaskId(id));
    querySelector('#${TaskHtmlClassName.body+id}').remove();
  }
}
