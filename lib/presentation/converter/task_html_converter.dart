import 'dart:html';

import 'package:TodoList_DDD/usecase/dto/task_dto.dart';


class TaskHtmlConverter {
  static HtmlElement execute(TaskDTO dto){
    var elementHtml = DivElement()
      ..className = TaskHtmlClassName.body
      ..id = dto.id;

    var text = ParagraphElement()..text = dto.text;
    var deleteHtml = IFrameElement()..className = 'fas fa-minus-square';
    elementHtml.insertAdjacentElement('beforeend', text);
    elementHtml.insertAdjacentElement('beforeend', deleteHtml);

    return elementHtml;
  }
}

class TaskHtmlClassName {
  static final body = 'task';
}