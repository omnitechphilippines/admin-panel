import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../helper/services/json_decoder.dart';
import 'identifier_model.dart';

class InvoiceListModel extends IdentifierModel<String> {
  final String invoiceId, clientName, invoiceDate, dueDate, amount, status, paymentMethod;

  InvoiceListModel(super.id, this.invoiceId, this.clientName, this.invoiceDate, this.dueDate, this.amount, this.status, this.paymentMethod);

  static InvoiceListModel fromJSON(Map<String, dynamic> json) {
    final JSONDecoder decoder = JSONDecoder(json);

    final String invoiceId = decoder.getString('invoice_id');
    final String clientName = decoder.getString('client_name');
    final String invoiceDate = decoder.getString('invoice_date');
    final String dueDate = decoder.getString('due_date');
    final String amount = decoder.getString('amount');
    final String status = decoder.getString('status');
    final String paymentMethod = decoder.getString('payment_method');

    return InvoiceListModel(decoder.getId, invoiceId, clientName, invoiceDate, dueDate, amount, status, paymentMethod);
  }

  static List<InvoiceListModel> listFromJSON(List<dynamic> list) {
    return list.map((dynamic e) => InvoiceListModel.fromJSON(e)).toList();
  }

  static List<InvoiceListModel>? _dummyList;

  static Future<List<InvoiceListModel>> get dummyList async {
    if (_dummyList == null) {
      final dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!;
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/invoice_list.json');
  }
}
