import 'dart:convert';

import 'package:flutter/services.dart';
import '../app/data/models/identifier_model.dart';
import '../helper/services/json_decoder.dart';

class TodoModel extends IdentifierModel {
  String task, name, avatar, status, priority;
  DateTime dueDate, createdAt;
  late bool isComplete;

  TodoModel(super.id, this.task, this.dueDate, this.name, this.avatar, this.status, this.priority, this.createdAt, this.isComplete);

  static TodoModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String task = decoder.getString('task');
    DateTime createdAt = decoder.getDateTime('created_at');
    DateTime dueDate = decoder.getDateTime('due_date');
    String name = decoder.getString('name');
    String avatar = decoder.getString('avatar');
    String status = decoder.getString('status');
    String priority = decoder.getString('priority');
    bool isComplete = decoder.getBool('key');

    return TodoModel(decoder.getId, task, dueDate, name, avatar, status, priority, createdAt, isComplete);
  }

  static List<TodoModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => TodoModel.fromJSON(e)).toList();
  }

  static List<TodoModel>? _dummyList;

  static Future<List<TodoModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/todo.json');
  }
}
