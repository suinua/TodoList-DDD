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
    // TODO: implement delete
  }

  @override
  TaskList findById(TaskListId taskListId) {
    return null;
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
    // TODO: implement update
  }
}
