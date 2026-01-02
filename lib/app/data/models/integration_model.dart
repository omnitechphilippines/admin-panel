import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../helper/services/json_decoder.dart';
import 'identifier_model.dart';

class CalendarIntegrationModel extends IdentifierModel<String> {
  final String imageUrl, title, description;
  late bool isChecked;

  CalendarIntegrationModel(super.id, this.imageUrl, this.title, this.description, this.isChecked);

  void onToggleSwitch(CalendarIntegrationModel calendarIntegration) {
    calendarIntegration.isChecked = !calendarIntegration.isChecked;
  }

  static CalendarIntegrationModel fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String imageUrl = decoder.getString('imageUrl');
    final String title = decoder.getString('title');
    final String description = decoder.getString('description');
    final bool isChecked = decoder.getBool('isChecked');

    return CalendarIntegrationModel(decoder.getId, imageUrl, title, description, isChecked);
  }

  static List<CalendarIntegrationModel> listFromJSON(List<dynamic> list) {
    return list.map((dynamic e) => CalendarIntegrationModel.fromJSON(e)).toList();
  }

  static List<CalendarIntegrationModel>? _dummyList;

  static Future<List<CalendarIntegrationModel>> get dummyList async {
    if (_dummyList == null) {
      final dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/calendar_integration_data.json');
  }
}
