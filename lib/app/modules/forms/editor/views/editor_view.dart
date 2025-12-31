import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/editor_controller.dart';

class EditorView extends GetView<EditorController> {
  const EditorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<EditorController>(
        init: controller,
        builder: (EditorController controller) {
          return Padding(
            padding: MySpacing.x(flexSpacing / 2),
            child: Center(
              child: MyFlex(
                children: <MyFlexItem>[
                  MyFlexItem(
                    sizes: 'lg-8',
                    child: MyCard(
                      shadow: MyShadow(elevation: 0.2),
                      child: Column(
                        children: <Widget>[
                          QuillSimpleToolbar(controller: controller.quillController, config: const QuillSimpleToolbarConfig()),
                          MySpacing.height(20),
                          const Divider(height: 0),
                          MySpacing.height(20),
                          SizedBox(
                            height: 100,
                            child: QuillEditor.basic(controller: controller.quillController, config: const QuillEditorConfig(autoFocus: true)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
