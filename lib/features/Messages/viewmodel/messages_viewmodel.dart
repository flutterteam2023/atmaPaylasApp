// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Messages/models/chat_room_model.dart';
import 'package:atma_paylas_app/features/Messages/models/feed_information_for_chat_model.dart';
import 'package:atma_paylas_app/features/Messages/models/message_model.dart';
import 'package:atma_paylas_app/features/Messages/models/message_type_enum.dart';
import 'package:atma_paylas_app/helpers/image_picker_helper.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessagesViewModel extends ChangeNotifier {
  MessagesViewModel({required this.channel}) {
    listenToMessages();
  }

  final WebSocketChannel channel;

  List<ChatRoomModel> messages = [];
  FeedInformationForChatModel? feedInformationForChatModel;
  final dateFormat = DateFormat('HH:mm:ss dd-MM-yyyy');
  void listenToMessages() {
    channel.stream.listen((message) {
      Log.success('$message', path: 'MessagesViewModel.listenToMessages');
      print(message);
      final messageMap = json.decode(message.toString()) as Map<String, dynamic>;
      Log.success('$messageMap', path: 'MessagesViewModel.listenToMessages messageMap');
      // Mesaj geçmişi için
      final previews = messageMap['previews'] as List<dynamic>?;
      previews?.forEach((element) {
        messages.add(ChatRoomModel.fromJson(element as Map<String, dynamic>));
      });

      messages.sort((a, b) {
        if (b.latestMessage != null && a.latestMessage != null) return 0;
        return b.latestMessage!.timestamp.compareTo(a.latestMessage!.timestamp);
      });

      // UI'ı güncellemek için dinleyicilere haber ver
      messages.forEach((element) {
        Log.info(element.toJson());
      });
      notifyListeners();
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
