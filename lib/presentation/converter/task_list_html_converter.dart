import 'dart:html';

import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';

class TaskListHtmlConverter {
  static HtmlElement execute(TaskListDTO dto) {
    var html = '''
<div class="${TaskListHtmlClassName.body}" id="${TaskListHtmlClassName.body+dto.id}">
  <div class="title">
    <div class="count">${dto.tasks.length}</div>
    <p class="text">${dto.title}</p>
  </div>
  <div class="${TaskListHtmlClassName.tasks}" id="${TaskListHtmlClassName.tasks + dto.id}">   
  </div>

  <div class="${TaskListHtmlClassName.newTaskForm}" id="${TaskListHtmlClassName.newTaskForm + dto.id}">
    <input type="text" class="${TaskListHtmlClassName.newTaskTextInput}" id="${TaskListHtmlClassName.newTaskTextInput + dto.id}">
    <a class="${TaskListHtmlClassName.addTaskButton}" id="${TaskListHtmlClassName.addTaskButton + dto.id}">
      <i class="fas fa-plus-circle"></i>
    </a>
  </div>
</div>
''';

    var htmlElement = Element.html(html);

    return htmlElement;
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
