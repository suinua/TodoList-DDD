import 'dart:html';

import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/presentation/converter/task_html_converter.dart';
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

    querySelector('#${TaskListHtmlClassName.addTaskButton + taskList.id}').onClick.listen((_){
      addNewTask(taskList.id);
    });
  }

  void resetNewTaskTextInput() {
    InputElement newTaskTextInputElement =
        querySelector('#${TaskListHtmlClassName.newTaskTextInput}');
    newTaskTextInputElement.value = '';
  }

  String _getNewTaskText(String id) {

    InputElement newTaskTextInputElement =
        querySelector('#${TaskListHtmlClassName.newTaskTextInput+id}');
    return newTaskTextInputElement.value;
  }

  void addNewTask(String id) {
    var text = _getNewTaskText(id);
    var task = _service.addTask(TaskListId(id), text);

    DivElement tasksArea = querySelector('#${TaskListHtmlClassName.tasks+id}');

    tasksArea.insertAdjacentElement(
        'beforeend', TaskHtmlConverter.execute(task));
  }
}
