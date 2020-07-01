import 'dart:html';

import 'package:TodoList_DDD/usecase/dto/task_dto.dart';

class TaskHtmlConverter {
  static HtmlElement execute(TaskDTO dto) {
    var html = '''
<div class="${TaskHtmlClassName.body}" id="${dto.id}">
 <p>${dto.text}</p>
 <i class="fas fa-minus-square"></i>
</div>
''';

    return Element.html(html);
  }
}

class TaskHtmlClassName {
  static final body = 'task';
}
