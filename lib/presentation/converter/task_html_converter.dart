import 'dart:html';

import 'package:TodoList_DDD/usecase/dto/task_dto.dart';

class TaskHtmlConverter {
  static HtmlElement execute(TaskDTO dto) {
    var html = '''
<div class="${TaskHtmlClassName.body}" id="${dto.id}">
 <div class="${TaskHtmlClassName.checkButton}" id="${TaskHtmlClassName.checkButton + dto.id}">
  <i class="far fa-square" id="${TaskHtmlClassName.checkBox + dto.id}"></i>
  <i class="far fa-check-square"  id="${TaskHtmlClassName.checkedBox + dto.id}"></i>
 </div>
 <p>${dto.text}</p>
 <div class="${TaskHtmlClassName.deleteButton}" id="${TaskHtmlClassName.deleteButton + dto.id}">
  <i class="fas fa-minus-square"></i>
 </div>
</div>
''';
    var htmlElement = Element.html(html);
    htmlElement
        .querySelector('#${TaskHtmlClassName.checkedBox + dto.id}')
        .style
        .display = 'none';

    return htmlElement;
  }
}

class TaskHtmlClassName {
  static final body = 'task';
  static final checkButton = 'checkTaskButton';
  static final checkBox = 'checkBox';
  static final checkedBox = 'checkedBox';
  static final deleteButton = 'deleteTaskButton';
}
