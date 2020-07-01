import 'dart:html';

import 'package:TodoList_DDD/presentation/converter/task_html_converter.dart';
import 'package:TodoList_DDD/usecase/dto/task_list_dto.dart';

class TaskListHtmlConverter {
  static HtmlElement execute(TaskListDTO dto) {
    var html = '''
<div class="${TaskListHtmlClassName.body}" id="${dto.id}">
  <div class="title"><p class="text">${dto.title}</p></div>
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
    var tasksHtmlElement = htmlElement.querySelector('#${TaskListHtmlClassName.tasks + dto.id}');
    dto.tasks.forEach((element) => tasksHtmlElement.insertAdjacentElement('beforeend', TaskHtmlConverter.execute(element)));

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
