import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../../../../helper/utils/my_utils.dart';
import '../../../data/models/email_model.dart';

class EmailController extends GetxController {
  List<EmailModel> emails = <EmailModel>[];
  List<EmailModel> filteredEmails = <EmailModel>[];
  final int itemsPerPage = 20;
  int currentPage = 1;
  String selectedCategory = 'Inbox';
  bool isEmailDetail = false;
  List<String> dummyTexts = List<String>.generate(12, (int index) => MyTextUtils.getDummyText(60));
  QuillController quillController = QuillController.basic();

  @override
  void onInit() {
    super.onInit();
    _loadEmails();
  }

  Future<void> _loadEmails() async {
    final List<EmailModel> emailList = await EmailModel.dummyList;
    emails = emailList;
    filterEmails();
  }

  void filterEmails() {
    filteredEmails = _categoryFilters[selectedCategory]?.call() ?? emails;
    update();
  }

  void onCategorySelected(String category) {
    selectedCategory = category;
    filterEmails();
    update();
  }

  void onReadMail(EmailModel email) {
    _toggleEmailProperty(email, (EmailModel e) => e.unread = !e.unread);
  }

  void onStarToggle(EmailModel email) {
    _toggleEmailProperty(email, (EmailModel e) => e.starred = !e.starred);
  }

  void onImportantToggle(EmailModel email) {
    _toggleEmailProperty(email, (EmailModel e) => e.important = !e.important);
  }

  void _toggleEmailProperty(EmailModel email, void Function(EmailModel) toggleAction) {
    toggleAction(email);
    update();
  }

  void toggleEmailDetail() {
    isEmailDetail = !isEmailDetail;
    update();
  }

  Map<String, List<EmailModel> Function()> get _categoryFilters => <String, List<EmailModel> Function()>{
    'Inbox': () => emails,
    'Starred': () => emails.where((EmailModel e) => e.starred).toList(),
    'Important': () => emails.where((EmailModel e) => e.important).toList(),
    'Updates': () => emails.where((EmailModel e) => e.category == 'updates').toList(),
    'Social': () => emails.where((EmailModel e) => e.category == 'social').toList(),
    'Promotions': () => emails.where((EmailModel e) => e.category == 'promotions').toList(),
    'Primary': () => emails,
  };

  void pageUp() {
    currentPage++;
    update();
  }

  void pageDown() {
    if (currentPage > 1) {
      currentPage--;
      update();
    }
  }
}
