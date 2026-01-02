import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../helper/services/json_decoder.dart';
import 'identifier_model.dart';

class TodoModel extends IdentifierModel<String> {
  String task, name, avatar, status, priority;
  DateTime dueDate, createdAt;
  late bool isComplete;

  TodoModel(super.id, this.task, this.dueDate, this.name, this.avatar, this.status, this.priority, this.createdAt, this.isComplete);

  static TodoModel fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String task = decoder.getString('task');
    final DateTime createdAt = decoder.getDateTime('created_at');
    final DateTime dueDate = decoder.getDateTime('due_date');
    final String name = decoder.getString('name');
    final String avatar = decoder.getString('avatar');
    final String status = decoder.getString('status');
    final String priority = decoder.getString('priority');
    final bool isComplete = decoder.getBool('key');

    return TodoModel(decoder.getId, task, dueDate, name, avatar, status, priority, createdAt, isComplete);
  }

  static List<TodoModel> listFromJSON(List<dynamic> list) {
    return list.map((dynamic e) => TodoModel.fromJSON(e)).toList();
  }

  static List<TodoModel>? _dummyList;

  static Future<List<TodoModel>> get dummyList async {
    if (_dummyList == null) {
      final dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/todo.json');
  }
}
