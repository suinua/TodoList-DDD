import 'dart:html';

import 'package:TodoList_DDD/presentation/converter/task_html_converter.dart';
import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';

class TaskListHtmlConverter {
  static HtmlElement execute(TaskListDTO dto) {
    var group = DivElement()..className = TaskListHtmlClassName.body;
    var titleHtml = DivElement()
      ..className = TaskListHtmlClassName.title
      ..id = dto.id;

    var titleTextHtml = ParagraphElement()
      ..className = 'text'
      ..text = dto.title;

    titleHtml.insertAdjacentElement('beforeend', titleTextHtml);
    group.insertAdjacentElement('beforeend', titleHtml);

    var tasksHtml = DivElement()..className = TaskListHtmlClassName.tasks;

    dto.tasks.forEach((element) => tasksHtml.insertAdjacentElement(
        'beforeend', TaskHtmlConverter.execute(element)));


    var addTaskButton = AnchorElement()
      ..className = TaskListHtmlClassName.addTaskButton
      ..id = dto.id;

    group.insertAdjacentElement('beforeend', tasksHtml);
    addTaskButton.insertAdjacentHtml('beforeend', '<i class="fas fa-plus-circle"></i>');
    group.insertAdjacentElement('beforeend', addTaskButton);

    return group;
  }
}

class TaskListHtmlClassName {
  static final body = 'taskList';
  static final title = 'title';
  static final tasks = 'tasks';
  static final addTaskButton = 'addTaskButton';
}
