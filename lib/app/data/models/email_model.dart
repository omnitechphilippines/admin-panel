import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../helper/services/json_decoder.dart';
import 'identifier_model.dart';

class EmailModel extends IdentifierModel<String> {
  final String from, subject, date, category, content;
  bool unread, starred, important;
  final List<String> label;
  final List<Attachments> attachments;

  EmailModel(super.id, this.from, this.subject, this.date, this.category, this.content, this.unread, this.starred, this.important, this.label, this.attachments);

  static EmailModel fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String from = decoder.getString('from');
    final String subject = decoder.getString('subject');
    final String date = decoder.getString('date');
    final String category = decoder.getString('category');
    final String content = decoder.getString('content');
    final bool unread = decoder.getBool('unread');
    final bool starred = decoder.getBool('starred');
    final bool important = decoder.getBool('important');
    final List<String>? label = decoder.getObjectListOrNull('labels');

    final List<dynamic>? attachmentData = decoder.getObjectListOrNull('attachments');
    List<Attachments> attachments = [];
    if (attachmentData != null) {
      attachments = Attachments.listFromJSON(attachmentData);
    }

    return EmailModel(decoder.getId, from, subject, date, category, content, unread, starred, important, label!, attachments);
  }

  static List<EmailModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => EmailModel.fromJSON(e)).toList();
  }

  static List<EmailModel>? _dummyList;

  static Future<List<EmailModel>> get dummyList async {
    if (_dummyList == null) {
      final dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/email.json');
  }
}

class Attachments extends IdentifierModel<String> {
  final String type, name;

  Attachments(super.id, this.type, this.name);

  static Attachments fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String type = decoder.getString('type');
    final String name = decoder.getString('name');

    return Attachments(decoder.getId, type, name);
  }

  static List<Attachments> listFromJSON(List<dynamic> list) {
    return list.map((dynamic e) => Attachments.fromJSON(e)).toList();
  }
}
