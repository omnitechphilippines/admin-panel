import 'package:get/get.dart';

class TimelineController extends GetxController {
  RxList<Map<String, Object>> timeLineData = <Map<String, Object>>[
    <String, Object>{'title': 'Completed UX design project for our client', 'description': 'Dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde?', 'isImportant': true},
    <String, Object>{'title': 'Yes! We are celebrating our first admin release.', 'description': 'Consectetur adipisicing elit. Iusto, optio, dolorum John deon provident.', 'isImportant': false},
    <String, Object>{'title': 'We released new version of our theme Omni.', 'description': '3 new photo Uploaded on facebook fan page.', 'isImportant': false},
    <String, Object>{'title': 'We have achieved 25k sales in our themes', 'description': 'Dolorum provident rerum aut hic quasi placeat iure tempora laudantium ipsa ad debitis unde?', 'isImportant': false},
    <String, Object>{'title': 'Yes! We are celebrating our first admin release.', 'description': 'Outdoor visit at California State Route 85 with John Boltana & Harry Piterson.', 'isImportant': false},
    <String, Object>{'title': 'Brand new blog section launched on our website', 'description': 'Stay tuned for new content related to design, themes, and more.', 'isImportant': false},
    <String, Object>{'title': 'Big discounts for Omni theme users', 'description': 'Limited-time offer. Grab your copy at a special price!', 'isImportant': true},
  ].obs;
}
