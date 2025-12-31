import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/chat_model.dart';

class ChatController extends GetxController {
  List<ChatModel> chat = <ChatModel>[];
  List<ChatModel> searchChat = <ChatModel>[];
  ChatModel? selectChat;
  ScrollController? scrollController;
  SearchController searchController = SearchController();
  TextEditingController messageController = TextEditingController();
  late GlobalKey<ScaffoldState> scaffoldKey;
  late Timer _timer;
  // int _nowTime = 0;
  // String _timeText = '00 : 00';
  int currentIndex = 0;
  List<Groups> group = <Groups>[];
  Timer? typingTimer;
  bool isTyping = false;
  String typingUserId = '';

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    ChatModel.dummyList.then((List<ChatModel> value) {
      chat = value;
      searchChat = value;
      selectChat = chat[0];
      update();
    });

    scrollController = ScrollController();

    group = <Groups>[Groups(name: 'General'), Groups(name: 'Company', badge: 33), Groups(name: 'Life Suckers', badge: 17), Groups(name: 'Drama Club'), Groups(name: 'Unknown Friends'), Groups(name: 'Family Ties', badge: 65), Groups(name: '2Good4U')];

    super.onInit();
  }

  void onTyping() {
    if (!isTyping) {
      isTyping = true;
      update();
    }

    typingTimer?.cancel();
    typingTimer = Timer(const Duration(milliseconds: 300), () {
      isTyping = false;
      update();
    });
  }

  void setTypingUser(String? userId) {
    typingUserId = userId ?? '';
    update();
  }

  void onSearchChat(String query) {
    final String input = query.toLowerCase();

    searchChat = chat.where((ChatModel chat) {
      return chat.firstName.toLowerCase().contains(input);
    }).toList();

    update();
  }

  void sendMessage() {
    if (messageController.value.text.isNotEmpty && selectChat != null) {
      selectChat!.messages.add(ChatMessageModel(-1, messageController.text, DateTime.now(), true));
      messageController.clear();
      scrollToBottom(isDelayed: true);
      update();
    }
  }

  void scrollToBottom({bool isDelayed = false}) {
    final int delay = isDelayed ? 400 : 0;
    Future<dynamic>.delayed(Duration(milliseconds: delay), () {
      scrollController!.animateTo(scrollController!.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeInOutCubicEmphasized);
    });
  }

  void onChangeChat(ChatModel selectSingleChat) {
    selectChat = selectSingleChat;
    update();
  }

  void onChangeIndex(int id) {
    currentIndex = id;
    update();
  }

  // void startTimer() {
  //   const Duration oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(oneSec, (Timer timer) {
  //     _nowTime = _nowTime + 1;
  //     _timeText = Generator.getTextFromSeconds(time: _nowTime);
  //     update();
  //   });
  // }

  @override
  void dispose() {
    _timer.cancel();
    typingTimer?.cancel();
    super.dispose();
  }
}

class Groups {
  String? name;
  int? badge;

  Groups({this.name, this.badge});
}
