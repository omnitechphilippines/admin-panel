import 'dart:convert';

import 'package:flutter/services.dart';
import '../app/data/models/identifier_model.dart';
import '../helper/services/json_decoder.dart';

class InvoiceListModel extends IdentifierModel {
  final String invoiceId, clientName, invoiceDate, dueDate, amount, status, paymentMethod;

  InvoiceListModel(super.id, this.invoiceId, this.clientName, this.invoiceDate, this.dueDate, this.amount, this.status, this.paymentMethod);

  static InvoiceListModel fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String invoiceId = decoder.getString('invoice_id');
    String clientName = decoder.getString('client_name');
    String invoiceDate = decoder.getString('invoice_date');
    String dueDate = decoder.getString('due_date');
    String amount = decoder.getString('amount');
    String status = decoder.getString('status');
    String paymentMethod = decoder.getString('payment_method');

    return InvoiceListModel(decoder.getId, invoiceId, clientName, invoiceDate, dueDate, amount, status, paymentMethod);
  }

  static List<InvoiceListModel> listFromJSON(List<dynamic> list) {
    return list.map((e) => InvoiceListModel.fromJSON(e)).toList();
  }

  static List<InvoiceListModel>? _dummyList;

  static Future<List<InvoiceListModel>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/invoice_list.json');
  }
}
