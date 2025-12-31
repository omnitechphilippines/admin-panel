import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../../helper/utils/my_shadow.dart';
import '../../../../../helper/utils/utils.dart';
import '../../../../../helper/widgets/my_card.dart';
import '../../../../../helper/widgets/my_container.dart';
import '../../../../../helper/widgets/my_flex.dart';
import '../../../../../helper/widgets/my_flex_item.dart';
import '../../../../../helper/widgets/my_list_extension.dart';
import '../../../../../helper/widgets/my_spacing.dart';
import '../../../../../helper/widgets/my_text.dart';
import '../../../../../helper/widgets/responsive.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../themes/ui_mixin.dart';
import '../../../../../views/layout/layout.dart';
import '../controllers/file_upload_controller.dart';

class FileUploadView extends GetView<FileUploadController> {
  const FileUploadView({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: MySpacing.x(flexSpacing / 2),
        child: Center(
          child: Obx(
            () => MyFlex(
              children: <MyFlexItem>[MyFlexItem(sizes: 'lg-8', child: fileUpload())],
            ),
          ),
        ),
      ),
    );
  }

  Widget fileUpload() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              MyText.labelLarge('Multiple File Select'),
              MySpacing.width(12),
              Switch(onChanged: controller.onSelectMultipleFile, value: controller.selectMultipleFile.value, activeThumbColor: theme.colorScheme.primary, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
            ],
          ),
          MySpacing.height(20),
          uploadFile(),
        ],
      ),
    );
  }

  Widget uploadFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyContainer.bordered(
          borderRadiusAll: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onTap: controller.pickFiles,
          paddingAll: 23,
          child: Center(
            heightFactor: 1.5,
            child: Padding(
              padding: MySpacing.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(LucideIcons.folder_up),
                  MySpacing.height(12),
                  MyContainer(
                    width: 340,
                    alignment: Alignment.center,
                    paddingAll: 0,
                    child: MyText.titleMedium('Drop files here or click to upload.', fontWeight: 600, muted: true, fontSize: 18, textAlign: TextAlign.center),
                  ),
                  MyContainer(
                    alignment: Alignment.center,
                    width: 610,
                    child: MyText.titleMedium('(This is just a demo dropzone. Selected files are not actually uploaded.)', muted: true, fontWeight: 500, fontSize: 16, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (controller.files.isNotEmpty) ...<dynamic>[
          MySpacing.height(16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: controller.files
                .mapIndexed(
                  (int index, PlatformFile file) => MyContainer.bordered(
                    borderRadiusAll: 8,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    paddingAll: 8,
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Stack(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            alignment: Alignment.topRight,
                            children: <Widget>[
                              MyContainer(height: 100, width: 100, borderRadiusAll: 8, color: UiMixin.contentTheme.onBackground.withAlpha(28), paddingAll: 0, child: const Icon(LucideIcons.file, size: 20)),
                              MyContainer.transparent(
                                onTap: () => controller.removeFile(file),
                                paddingAll: 4,
                                child: Icon(LucideIcons.trash_2, size: 20, color: UiMixin.contentTheme.danger),
                              ),
                            ],
                          ),
                          MySpacing.height(8),
                          MyText.bodyMedium(file.name, fontWeight: 600),
                          MySpacing.height(4),
                          MyText.bodySmall(Utils.getStorageStringFromByte(file.bytes?.length ?? 0), fontWeight: 600),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_lucide/flutter_lucide.dart';
// import 'package:get/get.dart';
// import '../../../../../controller/ui/components/forms/file_upload_controller.dart';
// import '../../../../../helper/utils/my_shadow.dart';
// import '../../../../../helper/utils/ui_mixins.dart';
// import '../../../../../helper/utils/utils.dart';
// import '../../../../../helper/widgets/my_card.dart';
// import '../../../../../helper/widgets/my_container.dart';
// import '../../../../../helper/widgets/my_flex.dart';
// import '../../../../../helper/widgets/my_flex_item.dart';
// import '../../../../../helper/widgets/my_list_extension.dart';
// import '../../../../../helper/widgets/my_spacing.dart';
// import '../../../../../helper/widgets/my_text.dart';
// import '../../../../../helper/widgets/responsive.dart';
// import '../../../../../themes/app_theme.dart';
// import '../../../../../views/layout/layout.dart';

// class FileUploadView extends StatefulWidget {
//   const FileUploadView({super.key});

//   @override
//   State<FileUploadView> createState() => _FileUploadViewState();
// }

// class _FileUploadViewState extends State<FileUploadView> with UIMixin {
//   FileUploadController controller = Get.put(FileUploadController());

//   @override
//   Widget build(BuildContext context) {
//     return Layout(
//       child: GetBuilder(
//         init: controller,
//         builder: (controller) {
//           return Padding(
//             padding: MySpacing.x(flexSpacing / 2),
//             child: Center(
//               child: MyFlex(
//                 children: [MyFlexItem(sizes: 'lg-8', child: fileUpload())],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget fileUpload() {
//     return MyCard(
//       shadow: MyShadow(elevation: 0.2),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               MyText.labelLarge("Multiple File Select"),
//               MySpacing.width(12),
//               Switch(onChanged: controller.onSelectMultipleFile, value: controller.selectMultipleFile, activeColor: theme.colorScheme.primary, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
//             ],
//           ),
//           MySpacing.height(20),
//           uploadFile(),
//         ],
//       ),
//     );
//   }

//   Widget uploadFile() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         MyContainer.bordered(
//           borderRadiusAll: 8,
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           onTap: controller.pickFiles,
//           paddingAll: 23,
//           child: Center(
//             heightFactor: 1.5,
//             child: Padding(
//               padding: MySpacing.all(8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Icon(LucideIcons.folder_up),
//                   MySpacing.height(12),
//                   MyContainer(
//                     width: 340,
//                     alignment: Alignment.center,
//                     paddingAll: 0,
//                     child: MyText.titleMedium("Drop files here or click to upload.", fontWeight: 600, muted: true, fontSize: 18, textAlign: TextAlign.center),
//                   ),
//                   MyContainer(
//                     alignment: Alignment.center,
//                     width: 610,
//                     child: MyText.titleMedium("(This is just a demo dropzone. Selected files are not actually uploaded.)", muted: true, fontWeight: 500, fontSize: 16, textAlign: TextAlign.center),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         if (controller.files.isNotEmpty) ...[
//           MySpacing.height(16),
//           Wrap(
//             spacing: 16,
//             runSpacing: 16,
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             children: controller.files
//                 .mapIndexed(
//                   (index, file) => MyContainer.bordered(
//                     borderRadiusAll: 8,
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     paddingAll: 8,
//                     child: SizedBox(
//                       width: 100,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             alignment: Alignment.topRight,
//                             children: [
//                               MyContainer(height: 100, width: 100, borderRadiusAll: 8, color: contentTheme.onBackground.withAlpha(28), paddingAll: 0, child: Icon(LucideIcons.file, size: 20)),
//                               MyContainer.transparent(
//                                 onTap: () => controller.removeFile(file),
//                                 paddingAll: 4,
//                                 child: Icon(LucideIcons.trash_2, size: 20, color: contentTheme.danger),
//                               ),
//                             ],
//                           ),
//                           MySpacing.height(8),
//                           MyText.bodyMedium(file.name, fontWeight: 600),
//                           MySpacing.height(4),
//                           MyText.bodySmall(Utils.getStorageStringFromByte(file.bytes?.length ?? 0), fontWeight: 600),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ],
//     );
//   }
// }
