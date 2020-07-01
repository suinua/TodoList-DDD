import 'dart:html';

import 'package:TodoList_DDD/presentation/converter/task_html_converter.dart';
import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';

class TaskListHtmlConverter {
  static HtmlElement execute(TaskListDTO dto) {
    var group = DivElement()
      ..className = TaskListHtmlClassName.body
      ..id = dto.id;
    var titleHtml = DivElement()..className = TaskListHtmlClassName.title;

    var titleTextHtml = ParagraphElement()
      ..className = 'text'
      ..text = dto.title;

    titleHtml.insertAdjacentElement('beforeend', titleTextHtml);
    group.insertAdjacentElement('beforeend', titleHtml);

    var tasksHtml = DivElement()
      ..className = TaskListHtmlClassName.tasks
      ..id = TaskListHtmlClassName.tasks + dto.id;

    dto.tasks.forEach((element) => tasksHtml.insertAdjacentElement(
        'beforeend', TaskHtmlConverter.execute(element)));

    group.insertAdjacentElement('beforeend', tasksHtml);
    group.insertAdjacentElement('beforeend', _buildNewTaskFormElement(dto));

    return group;
  }

  static HtmlElement _buildNewTaskFormElement(TaskListDTO dto) {
    var newTaskFormElement = DivElement()
      ..className = TaskListHtmlClassName.newTaskForm
      ..id = TaskListHtmlClassName.newTaskForm + dto.id;

    var newTaskTextInput = InputElement(type: 'text')
      ..className = TaskListHtmlClassName.newTaskTextInput
      ..id = TaskListHtmlClassName.newTaskTextInput + dto.id;
    newTaskFormElement.insertAdjacentElement('beforeend', newTaskTextInput);

    var addNewTaskButton = AnchorElement()
      ..className = TaskListHtmlClassName.addTaskButton
      ..id = TaskListHtmlClassName.addTaskButton + dto.id;

    addNewTaskButton.insertAdjacentHtml(
        'beforeend', '<i class="fas fa-plus-circle"></i>');
    newTaskFormElement.insertAdjacentElement('beforeend', addNewTaskButton);

    return newTaskFormElement;
  }
}

class TaskListHtmlClassName {
  static final body = 'taskList';
  static final title = 'title';
  static final tasks = 'tasks';
  static final newTaskForm = 'newTaskForm';
  static final newTaskTextInput = 'newTaskTextInput';
  static final addTaskButton = 'addNewTaskButton';
}
