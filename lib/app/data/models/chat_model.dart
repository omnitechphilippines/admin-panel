import 'dart:convert';
import 'package:flutter/services.dart';

import '../../../helper/services/json_decoder.dart';
import 'identifier_model.dart';

class ChatModel extends IdentifierModel<String> {
  final String firstName, image, email;
  final List<ChatMessageModel> messages;
  final DateTime timestamp;

  ChatModel(super.id, this.firstName, this.image, this.messages, this.email, this.timestamp);

  static ChatModel fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String firstName = decoder.getString('first_name');
    final String email = decoder.getString('email');
    final String image = decoder.getString('image');
    final DateTime timestamp = decoder.getDateTime('timestamp');

    final List<dynamic>? messagesList = decoder.getObjectListOrNull('messages');
    List<ChatMessageModel> messages = <ChatMessageModel>[];
    if (messagesList != null) {
      messages = ChatMessageModel.listFromJSON(messagesList);
    }

    return ChatModel(decoder.getId, firstName, image, messages, email, timestamp);
  }

  static List<ChatModel> listFromJSON(List<dynamic> list) {
    return list.map((dynamic e) => ChatModel.fromJSON(e)).toList();
  }

  static List<ChatModel>? _dummyList;

  static Future<List<ChatModel>> get dummyList async {
    if (_dummyList == null) {
      final dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/chat.json');
  }
}

class ChatMessageModel extends IdentifierModel<String> {
  final String message;
  final DateTime sendAt;
  final bool fromMe;

  ChatMessageModel(super.id, this.message, this.sendAt, this.fromMe);

  static ChatMessageModel fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String message = decoder.getString('message');
    final DateTime sendAt = decoder.getDateTime('send_at');
    final bool fromMe = decoder.getBool('from_me');

    return ChatMessageModel(decoder.getId, message, sendAt, fromMe);
  }

  static List<ChatMessageModel> listFromJSON(List<dynamic> list) {
    return list.map((dynamic e) => ChatMessageModel.fromJSON(e)).toList();
  }
}
