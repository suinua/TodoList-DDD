import 'dart:html';

import 'package:TodoList_DDD/usecase/dto/task_dto.dart';


class TaskHtmlConverter {
  static HtmlElement execute(TaskDTO dto){
    var taskHtml = DivElement()
      ..className = TaskHtmlClassName.body
      ..id = dto.id;

    var text = ParagraphElement()..text = dto.text;
    taskHtml.insertAdjacentElement('beforeend', text);
    taskHtml.insertAdjacentHtml(
        'beforeend', '<i class="fas fa-minus-square"></i>');

    return taskHtml;
  }
}

class TaskHtmlClassName {
  static final body = 'task';
}