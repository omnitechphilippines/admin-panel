import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:get/get.dart';

import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_container.dart';
import '../../../../helper/widgets/my_flex.dart';
import '../../../../helper/widgets/my_flex_item.dart';
import '../../../../helper/widgets/my_list_extension.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../images.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../../../data/models/email_model.dart';
import '../controllers/email_controller.dart';

class EmailView extends GetView<EmailController> {
  const EmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailController>(
      init: controller,
      builder: (EmailController controller) {
        final int totalPages = (controller.filteredEmails.length / controller.itemsPerPage).ceil();
        final int startIndex = (controller.currentPage - 1) * controller.itemsPerPage;
        final int endIndex = startIndex + controller.itemsPerPage;
        final List<EmailModel> currentItems = controller.filteredEmails.sublist(startIndex, endIndex < controller.filteredEmails.length ? endIndex : controller.filteredEmails.length);

        // Calculate lengths
        final int importantEmailsLength = controller.emails.where((EmailModel email) => email.important).length;
        final int starredEmailsLength = controller.emails.where((EmailModel email) => email.starred).length;

        return Layout(
          child: Padding(
            padding: MySpacing.x(flexSpacing / 2),
            child: MyFlex(
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-2.3', child: _indexView(importantEmailsLength, starredEmailsLength)),
                MyFlexItem(sizes: 'lg-9.7', child: controller.isEmailDetail ? _emailDetails() : _emailContentView(currentItems, totalPages)),
              ],
            ),
          ),
        );
      },
    );
  }

  // Index view
  Widget _indexView(int importantEmailsLength, int starredEmailsLength) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: Get.mediaQuery.size.height / 1.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_composeButton(), MySpacing.height(16), _buildNavigationItems(importantEmailsLength, starredEmailsLength), MySpacing.height(20), _buildLabelsSection(), const Spacer(), _storageInfo(), const Spacer()],
      ),
    );
  }

  // Compose Button
  Widget _composeButton() {
    return MyContainer(
      onTap: () {},
      color: UiMixin.contentTheme.danger,
      paddingAll: 12,
      child: Center(child: MyText.bodyMedium('Compose', fontWeight: 600, color: UiMixin.contentTheme.onPrimary)),
    );
  }

  // Navigation Items
  Widget _buildNavigationItems(int importantEmailsLength, int starredEmailsLength) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: <Widget>[
        _buildNavItem('Inbox', 0, LucideIcons.inbox, badge: controller.emails.length.toString(), badgeColor: UiMixin.contentTheme.danger),
        _buildNavItem('Starred', 1, LucideIcons.star, badge: starredEmailsLength.toString(), badgeColor: UiMixin.contentTheme.warning),
        _buildNavItem('Draft', 2, LucideIcons.file_text, badge: '32', badgeColor: UiMixin.contentTheme.info),
        _buildNavItem('Sent Mail', 3, LucideIcons.send),
        _buildNavItem('Trash', 4, LucideIcons.trash),
        _buildNavItem('Important', 5, LucideIcons.tag, badge: importantEmailsLength.toString(), badgeColor: UiMixin.contentTheme.success),
      ],
    );
  }

  // Labels Section
  Widget _buildLabelsSection() {
    return Wrap(
      runSpacing: 16,
      children: <Widget>[
        MyText.bodyMedium('Labels', fontWeight: 600),
        _buildNavItem('Updates', 6, LucideIcons.circle),
        _buildNavItem('Social', 7, LucideIcons.circle),
        _buildNavItem('Promotions', 8, LucideIcons.circle),
        _buildNavItem('Forums', 9, LucideIcons.circle),
      ],
    );
  }

  // Navigation Item Builder
  Widget _buildNavItem(String label, int index, IconData icon, {String? badge, Color? badgeColor}) {
    return InkWell(
      onTap: () {
        controller.onCategorySelected(label);
      },
      child: Row(
        children: <Widget>[
          Icon(icon, size: 16, color: UiMixin.contentTheme.secondary),
          MySpacing.width(12),
          Expanded(child: MyText.bodyMedium(label, fontWeight: 600, color: UiMixin.contentTheme.secondary)),
          if (badge != null) ...<Widget>[
            MyContainer(
              color: badgeColor!.withValues(alpha: 0.2),
              paddingAll: 4,
              child: MyText.labelSmall(badge, color: badgeColor, fontWeight: 600),
            ),
          ],
        ],
      ),
    );
  }

  // Storage Info Section
  Widget _storageInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyContainer(
          borderRadiusAll: 100,
          color: UiMixin.contentTheme.secondary.withValues(alpha: 0.2),
          padding: MySpacing.all(6),
          child: MyText.labelMedium('FREE', color: UiMixin.contentTheme.secondary, fontWeight: 600),
        ),
        MySpacing.height(12),
        MyText.bodyMedium('Storage', fontWeight: 600, color: UiMixin.contentTheme.secondary),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.46,
          color: UiMixin.contentTheme.success,
          minHeight: 5,
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
        ),
        const SizedBox(height: 8),
        MyText.bodyMedium('7.02 GB (46%) of 15 GB used', fontWeight: 600, color: UiMixin.contentTheme.secondary),
      ],
    );
  }

  // Email Content View (Main content with list and pagination)
  Widget _emailContentView(List<EmailModel> currentItems, int totalPages) {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      height: Get.mediaQuery.size.height / 1.35,
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: MySpacing.all(16), child: listingHeader()),
          _buildCategoryTabs(),
          Expanded(
            child: ListView.separated(
              itemCount: currentItems.length,
              padding: MySpacing.nTop(16),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final EmailModel email = currentItems[index];
                final double screenWidth = MediaQuery.of(context).size.width;
                return InkWell(
                  onTap: controller.toggleEmailDetail,
                  child: Row(
                    children: <Widget>[
                      Theme(
                        data: ThemeData(),
                        child: Checkbox(value: email.unread, visualDensity: const VisualDensity(horizontal: -4, vertical: -4), activeColor: UiMixin.contentTheme.primary, onChanged: (bool? value) => controller.onReadMail(email)),
                      ),
                      MySpacing.width(screenWidth > 600 ? 20 : 10),
                      InkWell(
                        onTap: () => controller.onStarToggle(email),
                        child: Icon(email.starred ? Icons.star : Icons.star_border_outlined, color: email.starred ? UiMixin.contentTheme.warning : null, size: screenWidth > 600 ? 24 : 20),
                      ),
                      MySpacing.width(screenWidth > 600 ? 20 : 10),
                      InkWell(
                        onTap: () => controller.onImportantToggle(email),
                        child: Icon(email.important ? Icons.label_important_rounded : Icons.label_important_outline, color: email.important ? UiMixin.contentTheme.warning : null, size: screenWidth > 600 ? 24 : 20),
                      ),
                      MySpacing.width(screenWidth > 600 ? 20 : 10),
                      SizedBox(width: screenWidth > 600 ? 150 : screenWidth * 0.3, child: MyText.bodyMedium(email.from, fontWeight: 600, muted: true)),
                      MySpacing.width(screenWidth > 600 ? 20 : 10),
                      Expanded(
                        child: SizedBox(
                          height: 32,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              MyText.bodyMedium(email.subject, fontWeight: 600, muted: true, overflow: TextOverflow.ellipsis),
                              MySpacing.width(4),
                              MyText.bodyMedium(email.content, fontWeight: 600, muted: true, overflow: TextOverflow.ellipsis),
                              MySpacing.width(12),
                              Wrap(
                                spacing: 12,
                                children: email.attachments.mapIndexed((int index, Attachments element) {
                                  return MyContainer(
                                    color: UiMixin.contentTheme.secondary.withValues(alpha: 0.2),
                                    paddingAll: 4,
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          element.type == 'image'
                                              ? LucideIcons.image
                                              : element.type == 'pdf'
                                              ? LucideIcons.file_text
                                              : element.type == 'zip'
                                              ? LucideIcons.file_archive
                                              : element.type == 'log'
                                              ? LucideIcons.scroll
                                              : element.type == 'doc'
                                              ? LucideIcons.sticky_note
                                              : null,
                                          color: UiMixin.contentTheme.secondary,
                                          size: 12,
                                        ),
                                        MySpacing.width(4),
                                        MyText.labelSmall(element.name, fontWeight: 500, color: UiMixin.contentTheme.secondary),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MySpacing.width(screenWidth > 600 ? 20 : 10),
                      MyText.bodyMedium(email.date, fontWeight: 600),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return MySpacing.height(12);
              },
            ),
          ),
          Padding(padding: MySpacing.all(16), child: _pagination(totalPages)),
        ],
      ),
    );
  }

  Widget _emailDetails() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      height: Get.mediaQuery.size.height / 1.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(onPressed: controller.toggleEmailDetail, icon: const Icon(LucideIcons.arrow_left, size: 20)),
              Expanded(child: MyText.bodyMedium('Medium', fontWeight: 600)),
              MyContainer(
                paddingAll: 12,
                color: UiMixin.contentTheme.secondary.withValues(alpha: 0.1),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[const Icon(LucideIcons.inbox, size: 18), MySpacing.width(20), const Icon(LucideIcons.mail_warning, size: 18), MySpacing.width(20), const Icon(LucideIcons.trash_2, size: 18)],
                ),
              ),
            ],
          ),
          MySpacing.height(16),
          MyContainer.bordered(
            height: 300,
            child: ListView(
              children: <Widget>[
                MyText.titleMedium('Hi Jorge, How are you?', fontWeight: 600),
                MySpacing.height(16),
                const Divider(height: 0),
                MySpacing.height(16),
                Row(
                  children: <Widget>[
                    MyContainer.rounded(height: 40, width: 40, paddingAll: 0, child: Image.asset(Images.avatars[1], fit: BoxFit.cover)),
                    MySpacing.width(12),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[MyText.bodyMedium('Jonathan Smith', fontWeight: 600), MySpacing.height(3), MyText.bodySmall('From: jonathan@domain.com', fontWeight: 600, muted: true)]),
                  ],
                ),
                MySpacing.height(20),
                MyText.bodyMedium('Hi Jorge...', fontWeight: 800),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[0], fontWeight: 600, muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[1], fontWeight: 600, muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[2], fontWeight: 600, muted: true),
                MySpacing.height(20),
                MyText.bodySmall(controller.dummyTexts[3], fontWeight: 600, muted: true),
                MySpacing.height(16),
                const Divider(height: 0),
                MySpacing.height(16),
                MyText.bodySmall('Attachment (3)', fontWeight: 600),
                MySpacing.height(16),
                Wrap(
                  spacing: 12,
                  children: <Widget>[
                    MyContainer.bordered(
                      paddingAll: 4,
                      child: MyContainer(paddingAll: 0, height: 80, child: Image.asset(Images.small[0], fit: BoxFit.cover)),
                    ),
                    MyContainer.bordered(
                      paddingAll: 4,
                      child: MyContainer(paddingAll: 0, height: 80, child: Image.asset(Images.small[1], fit: BoxFit.cover)),
                    ),
                    MyContainer.bordered(
                      paddingAll: 4,
                      child: MyContainer(paddingAll: 0, height: 80, child: Image.asset(Images.small[2], fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MySpacing.height(12),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyContainer.rounded(paddingAll: 0, height: 40, width: 40, child: Image.asset(Images.avatars[6], fit: BoxFit.cover)),
                MySpacing.width(12),
                Expanded(
                  child: SingleChildScrollView(
                    child: MyContainer.bordered(
                      paddingAll: 0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: MySpacing.all(8),
                            child: QuillSimpleToolbar(
                              controller: controller.quillController,
                              config: const QuillSimpleToolbarConfig(
                                showRedo: false,
                                showFontFamily: false,
                                showSubscript: false,
                                showSuperscript: false,
                                showUndo: false,
                                showUnderLineButton: false,
                                toolbarSize: 0,
                                toolbarSectionSpacing: 0,
                                toolbarRunSpacing: 12,
                              ),
                            ),
                          ),
                          const Divider(height: 0),
                          MySpacing.height(16),
                          Padding(
                            padding: MySpacing.all(8),
                            child: SizedBox(
                              height: 150,
                              child: QuillEditor.basic(controller: controller.quillController, config: const QuillEditorConfig(autoFocus: true)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MySpacing.height(12),
          Align(
            alignment: Alignment.centerRight,
            child: MyContainer(
              color: UiMixin.contentTheme.primary,
              paddingAll: 12,
              onTap: () => controller.toggleEmailDetail(),
              child: MyText.labelMedium('Send', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Widget listingHeader() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: <Widget>[
        MyContainer(
          paddingAll: 12,
          color: UiMixin.contentTheme.secondary.withValues(alpha: 0.1),
          child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[const Icon(LucideIcons.inbox, size: 18), MySpacing.width(20), const Icon(LucideIcons.mail_warning, size: 18), MySpacing.width(20), const Icon(LucideIcons.trash_2, size: 18)]),
        ),
        PopupMenuButton<String>(
          offset: const Offset(0, 44),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Social', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Promotion', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Updates', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Forums', fontWeight: 600)),
          ],
          child: MyContainer(
            color: UiMixin.contentTheme.secondary.withValues(alpha: 0.2),
            paddingAll: 12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.folder, size: 18, color: UiMixin.contentTheme.secondary),
                MySpacing.width(4),
                Icon(LucideIcons.chevron_down, size: 18, color: UiMixin.contentTheme.secondary),
              ],
            ),
          ),
        ),
        PopupMenuButton<String>(
          offset: const Offset(0, 44),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Updates', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Social', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Promotion', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Forums', fontWeight: 600)),
          ],
          child: MyContainer(
            color: UiMixin.contentTheme.secondary.withValues(alpha: 0.2),
            paddingAll: 12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.tags, size: 18, color: UiMixin.contentTheme.secondary),
                MySpacing.width(4),
                Icon(LucideIcons.chevron_down, size: 18, color: UiMixin.contentTheme.secondary),
              ],
            ),
          ),
        ),
        PopupMenuButton<String>(
          offset: const Offset(0, 44),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Mark as unread', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Add to task', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Add star', fontWeight: 600)),
            PopupMenuItem<String>(padding: MySpacing.xy(16, 8), height: 10, child: MyText.bodyMedium('Mute', fontWeight: 600)),
          ],
          child: MyContainer(
            color: UiMixin.contentTheme.secondary.withValues(alpha: 0.2),
            paddingAll: 12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyText.bodyMedium('More', fontWeight: 600, color: UiMixin.contentTheme.secondary),
                MySpacing.width(4),
                Icon(LucideIcons.chevron_down, size: 18, color: UiMixin.contentTheme.secondary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Category Tabs
  Widget _buildCategoryTabs() {
    return Padding(
      padding: MySpacing.bottom(16),
      child: Row(children: <Widget>[_buildCategoryTab('Primary', LucideIcons.inbox), _buildCategoryTab('Social', LucideIcons.users), _buildCategoryTab('Promotions', LucideIcons.inbox), _buildCategoryTab('Updates', LucideIcons.info)]),
    );
  }

  Widget _buildCategoryTab(String label, IconData icons) {
    final bool isActive = controller.selectedCategory == label;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyContainer(
            onTap: () => controller.onCategorySelected(label),
            padding: MySpacing.xy(16, 8),
            margin: MySpacing.right(8),
            child: Row(
              children: <Widget>[
                Icon(icons, size: 16, color: isActive ? UiMixin.contentTheme.primary : null),
                MySpacing.width(12),
                Flexible(
                  child: MyText.bodyMedium(label, fontWeight: 600, overflow: TextOverflow.ellipsis, color: isActive ? UiMixin.contentTheme.primary : null),
                ),
              ],
            ),
          ),
          MySpacing.height(8),
          Divider(height: 0, color: isActive ? UiMixin.contentTheme.primary : null),
        ],
      ),
    );
  }

  // Pagination Controls
  Widget _pagination(int totalPages) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        MyText.bodySmall('Showing 1 - 20 of 289', fontWeight: 600),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            MyContainer(
              onTap: controller.currentPage > 1 ? () => controller.pageDown() : null,
              paddingAll: 8,
              color: UiMixin.contentTheme.primary,
              child: Icon(Icons.chevron_left, color: UiMixin.contentTheme.onPrimary),
            ),
            MySpacing.width(4),
            MyContainer(
              onTap: controller.currentPage < totalPages ? () => controller.pageUp() : null,
              paddingAll: 8,
              color: UiMixin.contentTheme.primary,
              child: Icon(Icons.chevron_right, color: UiMixin.contentTheme.onPrimary),
            ),
          ],
        ),
      ],
    );
  }
}
