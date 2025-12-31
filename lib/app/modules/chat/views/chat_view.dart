import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import 'package:get/get.dart';

import '../../../../helper/utils/my_shadow.dart';
import '../../../../helper/utils/utils.dart';
import '../../../../helper/widgets/my_button.dart';
import '../../../../helper/widgets/my_card.dart';
import '../../../../helper/widgets/my_container.dart';
import '../../../../helper/widgets/my_flex.dart';
import '../../../../helper/widgets/my_flex_item.dart';
import '../../../../helper/widgets/my_spacing.dart';
import '../../../../helper/widgets/my_text.dart';
import '../../../../helper/widgets/my_text_style.dart';
import '../../../../helper/widgets/responsive.dart';
import '../../../../images.dart';
import '../../../../themes/app_theme.dart';
import '../../../../themes/ui_mixin.dart';
import '../../../../views/layout/layout.dart';
import '../../../data/models/chat_model.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: Drawer(child: drawerSetting()),
      endDrawer: Drawer(child: endDrawer()),
      body: Layout(
        child: GetBuilder<ChatController>(
          builder: (_) => Padding(
            padding: MySpacing.x(flexSpacing / 1.6),
            child: MyFlex(
              spacing: 3,
              children: <MyFlexItem>[
                MyFlexItem(sizes: 'lg-3', child: userIndex()),
                MyFlexItem(sizes: 'lg-8.98', child: messages()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userIndex() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      paddingAll: 0,
      height: 800,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: MySpacing.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText.titleMedium('Chat', fontWeight: 600),
                    InkWell(onTap: () => controller.scaffoldKey.currentState?.openDrawer(), child: const Icon(LucideIcons.settings, size: 16)),
                  ],
                ),
                MySpacing.height(16),
                TextFormField(
                  style: MyTextStyle.bodyMedium(),
                  onChanged: controller.onSearchChat,
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: MyTextStyle.bodyMedium(),
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    isCollapsed: true,
                    isDense: true,
                    suffixIcon: const Icon(LucideIcons.search, size: 14),
                    contentPadding: MySpacing.all(16),
                  ),
                ),
                MySpacing.height(20),
                SizedBox(
                  height: 36,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: Images.avatars.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String img = Images.avatars[index];
                      return InkWell(
                        onTap: () {},
                        child: Stack(
                          children: <Widget>[
                            MyContainer.rounded(paddingAll: 0, child: Image.asset(img)),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: MyContainer.rounded(paddingAll: 2, child: MyContainer.rounded(paddingAll: 4, color: UiMixin.contentTheme.success)),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => MySpacing.width(10),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          inboxTab(),
          if (controller.currentIndex == 0) chatUserList(),
          if (controller.currentIndex == 1) groupView(),
          if (controller.currentIndex == 2) userContacts(),
        ],
      ),
    );
  }

  Widget chatUserList() {
    return Expanded(
      child: controller.searchChat.isEmpty
          ? Center(child: MyText.bodyMedium('Not User Found', fontWeight: 600))
          : ListView.separated(
              shrinkWrap: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              itemCount: controller.searchChat.length,
              padding: MySpacing.top(16),
              itemBuilder: (BuildContext context, int index) {
                final ChatModel chat = controller.chat[index];
                final String name = chat.firstName;

                final List<TextSpan> textSpans = _highlightText(name, controller.searchController.text);

                return MyButton(
                  onPressed: () => controller.onChangeChat(chat),
                  elevation: 0,
                  borderRadiusAll: 8,
                  padding: MySpacing.all(12),
                  backgroundColor: theme.colorScheme.surface.withAlpha(5),
                  splashColor: theme.colorScheme.onSurface.withAlpha(10),
                  child: Row(
                    children: <Widget>[
                      MyContainer.rounded(paddingAll: 0, height: 44, width: 44, child: Image.asset(chat.image)),
                      MySpacing.width(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(style: MyTextStyle.bodyMedium(), children: textSpans),
                                  ),
                                ),
                                MyText.bodySmall(Utils.getTimeStringFromDateTime(chat.timestamp, showSecond: false), fontWeight: 600, maxLines: 1, overflow: TextOverflow.ellipsis, muted: true),
                              ],
                            ),
                            MySpacing.height(6),
                            MyText.bodySmall(chat.messages.lastOrNull!.message, overflow: TextOverflow.ellipsis, muted: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20),
            ),
    );
  }

  List<TextSpan> _highlightText(String text, String searchQuery) {
    if (searchQuery.isEmpty) {
      return <TextSpan>[TextSpan(text: text)];
    }

    final RegExp regex = RegExp(RegExp.escape(searchQuery), caseSensitive: false);
    final List<TextSpan> textSpans = <TextSpan>[];
    int start = 0;

    for (final RegExpMatch match in regex.allMatches(text)) {
      if (match.start > start) {
        textSpans.add(TextSpan(text: text.substring(start, match.start)));
      }
      textSpans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue), // Highlight style
        ),
      );
      start = match.end;
    }

    if (start < text.length) {
      textSpans.add(TextSpan(text: text.substring(start)));
    }

    return textSpans;
  }

  Widget groupView() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: MySpacing.xy(12, 8),
            child: Row(
              children: <Widget>[
                MyContainer(
                  height: 48,
                  width: 48,
                  color: UiMixin.contentTheme.primary.withValues(alpha: 0.2),
                  paddingAll: 0,
                  child: Center(child: Icon(LucideIcons.user, size: 20, color: UiMixin.contentTheme.primary)),
                ),
                MySpacing.width(16),
                MyText.bodyMedium('New Group', fontWeight: 600),
              ],
            ),
          ),
          ListView.separated(
            itemCount: controller.group.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: MySpacing.xy(12, 8),
            itemBuilder: (BuildContext context, int index) {
              final Groups currentGroup = controller.group[index];

              return Row(
                children: <Widget>[
                  MyContainer(
                    height: 48,
                    width: 48,
                    color: UiMixin.contentTheme.primary.withValues(alpha: 0.2),
                    paddingAll: 0,
                    child: Center(child: MyText.titleMedium(currentGroup.name != null && currentGroup.name!.isNotEmpty ? currentGroup.name![0] : 'G', fontWeight: 700, color: UiMixin.contentTheme.primary)),
                  ),
                  MySpacing.width(16),
                  MyText.bodyMedium('#${currentGroup.name}', fontWeight: 600),
                  const Spacer(),
                  if (currentGroup.badge != null && currentGroup.badge! > 0)
                    MyContainer.bordered(
                      borderColor: UiMixin.contentTheme.danger,
                      paddingAll: 4,
                      child: MyText.bodySmall('+${currentGroup.badge} ', fontWeight: 700, color: UiMixin.contentTheme.danger),
                    ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => MySpacing.height(16),
          ),
        ],
      ),
    );
  }

  Widget userContacts() {
    Widget buildUserRow(String avatarPath, String name, String status) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(backgroundImage: AssetImage(avatarPath), radius: 18),
        title: Text(name, style: const TextStyle(fontSize: 14)),
        subtitle: status.isNotEmpty ? Text(status, style: const TextStyle(color: Colors.grey, fontSize: 12)) : null,
        onTap: () {},
      );
    }

    return Expanded(
      child: ListView(
        padding: MySpacing.all(20),
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                MyContainer.rounded(
                  height: 48,
                  width: 48,
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 0,
                  child: Icon(LucideIcons.users, size: 16, color: UiMixin.contentTheme.onPrimary),
                ),
                MySpacing.width(12),
                MyText.bodyMedium('New Group', fontWeight: 600),
              ],
            ),
          ),
          MySpacing.height(12),
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                MyContainer.rounded(
                  height: 48,
                  width: 48,
                  color: UiMixin.contentTheme.primary,
                  paddingAll: 0,
                  child: Icon(LucideIcons.user_plus, size: 16, color: UiMixin.contentTheme.onPrimary),
                ),
                MySpacing.width(12),
                MyText.bodyMedium('New Contact', fontWeight: 600),
              ],
            ),
          ),
          MySpacing.height(12),
          buildUserRow(Images.avatars[0], 'Omni Tech', ''),
          buildUserRow(Images.avatars[1], 'Fantina LeBatelier', '** no status **'),
          buildUserRow(Images.avatars[2], 'Gilbert Chicoine', '|| Karma ||'),
          buildUserRow(Images.avatars[3], 'Mignonette Brodeur', 'Hey there! I am using Chat.'),
          buildUserRow(Images.avatars[4], 'Thomas Menard', 'TM'),
          buildUserRow(Images.avatars[5], 'Melisande Lapointe', 'Available'),
          buildUserRow(Images.avatars[6], 'Danielle Despins', 'Hey there! I am using Chat.'),
        ],
      ),
    );
  }

  Widget inboxTab() {
    Widget customIndex(int id, String title) {
      final bool index = controller.currentIndex == id;
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MyContainer(
              onTap: () => controller.onChangeIndex(id),
              padding: MySpacing.xy(12, 8),
              child: MyText.bodyMedium(title, fontWeight: 600, color: index ? UiMixin.contentTheme.secondary : null),
            ),
            MySpacing.height(8),
            Divider(color: index ? UiMixin.contentTheme.secondary : null, height: 0),
          ],
        ),
      );
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[customIndex(0, 'Chat'), customIndex(1, 'Group'), customIndex(2, 'Contact')]);
  }

  Widget messages() {
    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      paddingAll: 0,
      height: 800,
      child: Column(
        children: <Widget>[
          userDetail(),
          const Divider(height: 0),
          Expanded(
            child: ListView.separated(
              padding: MySpacing.xy(16, 12),
              shrinkWrap: true,
              controller: controller.scrollController,
              itemCount: (controller.selectChat?.messages ?? <ChatMessageModel>[]).length,
              itemBuilder: (BuildContext context, int index) {
                final ChatMessageModel message = (controller.selectChat?.messages ?? <ChatMessageModel>[])[index];
                final bool isSent = message.fromMe == true;
                final Color theme = isSent ? UiMixin.contentTheme.primary : UiMixin.contentTheme.secondary.withAlpha(32);
                return Row(
                  mainAxisAlignment: isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Wrap(
                        alignment: isSent ? WrapAlignment.end : WrapAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              MyContainer(
                                padding: const EdgeInsets.all(8),
                                margin: EdgeInsets.only(left: isSent ? MediaQuery.of(context).size.width * 0.20 : 0, right: isSent ? 0 : MediaQuery.of(context).size.width * 0.20),
                                color: theme,
                                child: Column(
                                  crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[MyText.bodyMedium(message.message, fontWeight: 600, color: isSent ? UiMixin.contentTheme.onPrimary : UiMixin.contentTheme.secondary, overflow: TextOverflow.clip)],
                                ),
                              ),
                              MySpacing.height(4),
                              MyText.labelSmall('${Utils.getTimeStringFromDateTime(message.sendAt, showSecond: false)}', fontSize: 9, muted: true, fontWeight: 600),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => MySpacing.height(12),
            ),
          ),
          MyContainer.none(paddingAll: 9, color: UiMixin.contentTheme.dark.withAlpha(16), child: sendMessage()),
        ],
      ),
    );
  }

  Widget userDetail() {
    return Padding(
      padding: MySpacing.all(20),
      child: InkWell(
        onTap: () => controller.scaffoldKey.currentState!.openEndDrawer(),
        child: Row(
          children: <Widget>[
            if (controller.selectChat != null)
              MyContainer(
                height: 36,
                width: 36,
                paddingAll: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(controller.selectChat!.image, fit: BoxFit.cover),
              ),
            MySpacing.width(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (controller.selectChat != null) MyText.bodyMedium(controller.selectChat!.firstName, fontWeight: 600),
                if (!controller.isTyping)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const MyContainer.rounded(paddingAll: 4, color: Colors.green),
                      MySpacing.width(4),
                      MyText.bodySmall('Active Now', fontWeight: 600, muted: true),
                    ],
                  ),
                if (controller.isTyping) MyText.bodySmall('Typing...', fontWeight: 600),
              ],
            ),
            const Spacer(),
            InkWell(onTap: () {}, child: const Icon(LucideIcons.phone_call, size: 20)),
            MySpacing.width(12),
            InkWell(onTap: () {}, child: const Icon(LucideIcons.video, size: 20)),
            MySpacing.width(12),
            InkWell(onTap: () {}, child: const Icon(LucideIcons.users, size: 20)),
            MySpacing.width(12),
            InkWell(onTap: () {}, child: const Icon(LucideIcons.trash_2, size: 20)),
          ],
        ),
      ),
    );
  }

  Widget sendMessage() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MyContainer.none(
          paddingAll: 10,
          color: UiMixin.contentTheme.secondary.withValues(alpha: 0.1),
          child: Icon(LucideIcons.smile, size: 16, color: UiMixin.contentTheme.secondary),
        ),
        Expanded(
          child: MyContainer.none(
            paddingAll: 0,
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              textInputAction: TextInputAction.go,
              controller: controller.messageController,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              onChanged: (String value) {
                controller.onTyping();
              },
              style: MyTextStyle.bodyMedium(fontWeight: 600, color: UiMixin.contentTheme.secondary),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: MySpacing.xy(12, 14),
                hintText: 'Enter your message',
                hintStyle: MyTextStyle.bodyMedium(fontWeight: 600, color: UiMixin.contentTheme.secondary),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        MySpacing.width(12),
        MyContainer.none(
          paddingAll: 8,
          color: UiMixin.contentTheme.secondary.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(4)),
          child: Icon(LucideIcons.paperclip, size: 16, color: UiMixin.contentTheme.secondary),
        ),
        MyContainer.none(
          paddingAll: 8,
          color: UiMixin.contentTheme.secondary.withValues(alpha: 0.1),
          child: Icon(LucideIcons.video, size: 16, color: UiMixin.contentTheme.secondary),
        ),
        MyContainer.none(
          paddingAll: 8,
          onTap: () => controller.sendMessage(),
          color: UiMixin.contentTheme.primary,
          borderRadius: const BorderRadius.horizontal(right: Radius.circular(4)),
          child: Icon(LucideIcons.send, size: 16, color: UiMixin.contentTheme.onPrimary),
        ),
      ],
    );
  }

  Widget endDrawer() {
    Widget userDetail(IconData? icon, String title, String detail) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[Icon(icon, size: 16), MySpacing.width(8), MyText.bodyMedium(title, fontWeight: 700)]),
          MySpacing.height(8),
          MyText.bodyMedium(detail, fontWeight: 600, muted: true),
        ],
      );
    }

    return MyCard(
      shadow: MyShadow(elevation: 0.2),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText.titleMedium('Profile', fontWeight: 600),
              IconButton(
                onPressed: () {
                  controller.scaffoldKey.currentState!.closeEndDrawer();
                },
                icon: const Icon(LucideIcons.x),
              ),
            ],
          ),
          MySpacing.height(20),
          MyContainer.roundBordered(
            paddingAll: 4,
            height: 100,
            width: 100,
            child: MyContainer.rounded(paddingAll: 0, child: Image.asset(controller.selectChat != null ? controller.selectChat!.image : Images.avatars[0], fit: BoxFit.cover)),
          ),
          MySpacing.height(12),
          MyText.titleMedium(controller.selectChat != null ? controller.selectChat!.firstName : 'Aston Lapierre', fontWeight: 600),
          MySpacing.height(12),
          MyContainer(
            color: UiMixin.contentTheme.primary,
            paddingAll: 12,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(LucideIcons.mail, color: UiMixin.contentTheme.onPrimary, size: 16),
                MySpacing.width(8),
                MyText.labelMedium('Send Email', fontWeight: 600, color: UiMixin.contentTheme.onPrimary),
              ],
            ),
          ),
          MySpacing.height(12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyText.bodyMedium('Last Interacted:', fontWeight: 600),
              MySpacing.width(4),
              MyText.bodyMedium('Online', fontWeight: 600, color: UiMixin.contentTheme.success),
            ],
          ),
          const Divider(height: 62),
          userDetail(LucideIcons.phone, 'Phone NUmber:', '+12 1234567890'),
          MySpacing.height(28),
          userDetail(LucideIcons.map_pin, 'Location:', 'California, USA'),
          MySpacing.height(28),
          userDetail(LucideIcons.globe, 'Language:', 'English, German, Spanish'),
          MySpacing.height(28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: <Widget>[const Icon(LucideIcons.user, size: 16), MySpacing.width(8), MyText.bodyMedium('Groups :', fontWeight: 700)]),
              MySpacing.height(12),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: <Widget>[
                  MyContainer(
                    color: UiMixin.contentTheme.success.withValues(alpha: 0.2),
                    paddingAll: 4,
                    child: MyText.bodyMedium('Work', fontWeight: 600, color: UiMixin.contentTheme.success),
                  ),
                  MyContainer(
                    color: UiMixin.contentTheme.primary.withValues(alpha: 0.2),
                    paddingAll: 4,
                    child: MyText.bodyMedium('Friends', fontWeight: 600, color: UiMixin.contentTheme.primary),
                  ),
                ],
              ),
            ],
          ),
          MySpacing.height(28),
          Row(
            children: <Widget>[
              Expanded(child: MyText.titleMedium('Shared Photos', fontWeight: 600)),
              InkWell(onTap: () {}, child: MyText.bodyMedium('See All', fontWeight: 600)),
            ],
          ),
          MySpacing.height(12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: <Widget>[
              MyContainer(
                height: 50,
                width: 80,
                paddingAll: 0,
                borderRadiusAll: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(Images.small[0], fit: BoxFit.cover),
              ),
              MyContainer(
                height: 50,
                width: 80,
                paddingAll: 0,
                borderRadiusAll: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(Images.small[1], fit: BoxFit.cover),
              ),
              MyContainer(
                height: 50,
                width: 80,
                paddingAll: 0,
                borderRadiusAll: 8,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: <Widget>[
                    Image.asset(Images.small[2], fit: BoxFit.cover),
                    MyContainer(
                      color: UiMixin.contentTheme.dark.withValues(alpha: 0.3),
                      child: Center(child: MyText.bodyMedium('+3', fontWeight: 600, color: UiMixin.contentTheme.onDark)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerSetting() {
    return Scaffold(
      appBar: AppBar(
        title: MyText.bodyMedium('Profile', fontWeight: 600),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[IconButton(onPressed: () => controller.scaffoldKey.currentState!.closeDrawer(), visualDensity: VisualDensity.compact, icon: const Icon(LucideIcons.x, size: 16))],
      ),
      body: MyContainer(
        paddingAll: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[userProfile(), const Divider(), settingsAccordion()]),
      ),
    );
  }

  Widget userProfile() {
    return Padding(
      padding: MySpacing.nTop(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium('Setting', fontWeight: 600),
          MySpacing.height(12),
          Row(
            children: <Widget>[
              MyContainer.rounded(paddingAll: 0, height: 40, width: 40, child: Image.asset(Images.avatars[0], fit: BoxFit.cover)),
              MySpacing.width(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[MyText.titleMedium('Omni Tech', fontWeight: 600), const SizedBox(height: 4), MyText.bodySmall('Hey there! I am using Omni Chat.', fontWeight: 600, xMuted: true)],
                ),
              ),
              IconButton(icon: const Icon(Icons.qr_code_scanner), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget settingsAccordion() {
    return Expanded(
      child: Padding(
        padding: MySpacing.x(14),
        child: ListView(
          children: <Widget>[
            _buildAccordionItem(
              titleIcons: LucideIcons.key_round,
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              children: <Widget>[
                _buildListTile(title: 'Privacy', icon: LucideIcons.lock),
                MySpacing.height(12),
                _buildListTile(title: 'Security'),
                MySpacing.height(12),
                _buildListTile(title: 'Two-step verification', icon: LucideIcons.badge_check),
                MySpacing.height(12),
                _buildListTile(title: 'Change number', icon: LucideIcons.arrow_right_to_line),
                MySpacing.height(12),
                _buildListTile(title: 'Request account info', icon: LucideIcons.info),
                MySpacing.height(12),
                _buildListTile(title: 'Delete my account', icon: LucideIcons.trash),
                MySpacing.height(12),
              ],
            ),
            _buildAccordionItem(
              titleIcons: LucideIcons.message_square_quote,
              title: 'Chats',
              subtitle: 'Theme, wallpapers, chat history',
              children: <Widget>[
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: Align(alignment: Alignment.centerLeft, child: MyText.titleMedium('Display', fontWeight: 600)),
                ),
                MySpacing.height(8),
                _buildListTile(title: 'Theme', subtitle: 'System default', icon: LucideIcons.palette),
                MySpacing.height(12),
                _buildListTile(title: 'Wallpaper', icon: LucideIcons.image),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                _buildSwitchListTile('Media Visibility', 'Show newly downloaded media in your phone\'s gallery', true, (bool value) {}),
                _buildSwitchListTile('Enter is send', 'Enter key will send your message', false, (bool value) {}),
                _buildListTile(title: 'Font size', subtitle: 'Small'),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                _buildListTile(title: 'App Language', subtitle: 'English', icon: LucideIcons.type),
                MySpacing.height(12),
                _buildListTile(title: 'Chat Backup', icon: LucideIcons.cloud_upload),
                MySpacing.height(12),
                _buildListTile(title: 'Chat History', icon: LucideIcons.history),
                MySpacing.height(12),
              ],
            ),
            _buildAccordionItem(
              titleIcons: LucideIcons.bell,
              title: 'Notification',
              subtitle: 'Message, group, call tones',
              children: <Widget>[
                _buildSwitchListTile('Conversation Tones', 'Play sound for incoming and outgoing message.', true, (bool value) {}),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: Align(alignment: Alignment.centerLeft, child: MyText.titleMedium('Messages', fontWeight: 600)),
                ),
                MySpacing.height(12),
                _buildListTile(title: 'Notification Tone', subtitle: 'Default ringtone'),
                MySpacing.height(12),
                _buildListTile(title: 'Vibrate', subtitle: 'Default'),
                MySpacing.height(12),
                _buildListTile(title: 'Light', subtitle: 'White'),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: Align(alignment: Alignment.centerLeft, child: MyText.titleMedium('Groups', fontWeight: 600)),
                ),
                MySpacing.height(12),
                _buildListTile(title: 'Group Notification Tone', subtitle: 'Default ringtone'),
                MySpacing.height(12),
                _buildListTile(title: 'Group Vibrate', subtitle: 'Off'),
                MySpacing.height(12),
                _buildListTile(title: 'Group Light', subtitle: 'Dark'),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: Align(alignment: Alignment.centerLeft, child: MyText.titleMedium('Calls', fontWeight: 600)),
                ),
                MySpacing.height(12),
                _buildListTile(title: 'Call Ringtone', subtitle: 'Default ringtone'),
                MySpacing.height(12),
                _buildListTile(title: 'Call Vibrate', subtitle: 'Default'),
                MySpacing.height(12),
              ],
            ),
            _buildAccordionItem(
              titleIcons: LucideIcons.history,
              title: 'Storage and data',
              subtitle: 'Network usage, auto download',
              children: <Widget>[
                _buildListTile(title: 'Manage storage', subtitle: '2.4 GB', icon: Icons.folder),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                _buildListTile(title: 'Network usage', subtitle: '7.2 GB sent - 13.8 GB received', icon: Icons.wifi),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                _buildListTile(title: 'Media auto-download', subtitle: 'Voice message are always automatically downloaded', icon: Icons.cloud_download),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                _buildListTile(title: 'When using mobile data', subtitle: 'No media', icon: Icons.wifi),
                MySpacing.height(12),
                _buildListTile(title: 'When connected on wi-fi', subtitle: 'No media', icon: Icons.wifi),
                MySpacing.height(12),
                _buildListTile(title: 'When roaming', subtitle: 'No media', icon: Icons.wifi),
                MySpacing.height(12),
                const Divider(height: 0),
                MySpacing.height(12),
                _buildListTile(title: 'Photo upload quality', subtitle: 'Auto (recommended)', icon: Icons.image),
                MySpacing.height(12),
              ],
            ),
            _buildAccordionItem(
              titleIcons: LucideIcons.info,
              title: 'Help',
              subtitle: 'Help center, contact us, privacy policy',
              children: <Widget>[
                _buildListTile(title: 'Help center', icon: Icons.info_outline),
                MySpacing.height(12),
                _buildListTile(title: 'Contact us', subtitle: 'Questions?', icon: Icons.contact_phone),
                MySpacing.height(12),
                _buildListTile(title: 'Teams and Privacy Policy', icon: Icons.book),
                MySpacing.height(12),
                _buildListTile(title: 'App info', icon: Icons.info),
                MySpacing.height(12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccordionItem({IconData? titleIcons, String? title, String? subtitle, List<Widget>? children}) {
    return ExpansionTile(
      visualDensity: VisualDensity.compact,
      tilePadding: MySpacing.all(flexSpacing / 2.5),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(titleIcons, size: 20),
          if (titleIcons != null) MySpacing.width(12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[if (title != null) MyText.titleMedium(title, fontWeight: 600), MySpacing.height(4), if (subtitle != null) MyText.bodySmall(subtitle, muted: true)]),
          ),
        ],
      ),
      children: children!,
    );
  }

  Widget _buildListTile({String? title, String? subtitle, IconData? icon}) {
    return Padding(
      padding: MySpacing.x(flexSpacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (icon != null) Icon(icon, size: 16),
          if (icon != null) MySpacing.width(12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[if (title != null) MyText.bodyMedium(title, fontWeight: 600, muted: true), if (subtitle != null) MyText.bodySmall(subtitle, xMuted: true, fontWeight: 600)]),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(title: MyText.bodyMedium(title, fontWeight: 600), subtitle: MyText.bodySmall(subtitle, xMuted: true), value: value, onChanged: onChanged);
  }
}
