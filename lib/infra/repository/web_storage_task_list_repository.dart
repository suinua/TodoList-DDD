import 'dart:convert';
import 'dart:html';

import 'package:TodoList_DDD/domain/model/task_list.dart';
import 'package:TodoList_DDD/domain/repository/task_list_repository.dart';

import 'json_adapter/task_list_json_adapter.dart';

class WebStorageTaskListRepository extends TaskListRepository {
  const WebStorageTaskListRepository();

  static void _init() {
    window.localStorage['task_list'] = '[]';
  }

  @override
  void add(TaskList taskList) {
    if (window.localStorage['task_list'] == null) {
      window.localStorage['task_list'] = '[]';
    }

    var all = getAll();
    all.add(taskList);

    window.localStorage['task_list'] =
        json.encode(all.map((e) => TaskListJsonAdapter.encode(e)).toList());
  }

  @override
  void delete(TaskList taskList) {
    var all = getAll();
    all.asMap().removeWhere((key,value) {
      return value.id == taskList.id;
    });
    window.localStorage['task_list'] =
        json.encode(all.map((e) => TaskListJsonAdapter.encode(e)).toList());
  }

  @override
  TaskList findById(TaskListId taskListId) {
    var all = getAll();
    var hit = all.where((element) => element.id == taskListId).toList();
    if (hit.isEmpty) return null;
    return hit.first;
  }

  @override
  List<TaskList> getAll() {
    var textData = window.localStorage['task_list'];
    if (textData == null) return [];
    List jsonData = jsonDecode(textData);
    return jsonData.map((e) => TaskListJsonAdapter.decode(e)).toList();
  }

  @override
  void update(TaskList taskList) {
    int index;
    var all = getAll();

    var i = 0;
    all.removeWhere((value) {
      if (value.id == taskList.id) index = i;
      i++;
      return value.id == taskList.id;
    });

    all.insert(index, taskList);
    window.localStorage['task_list'] =
        json.encode(all.map((e) => TaskListJsonAdapter.encode(e)).toList());
  }
}
