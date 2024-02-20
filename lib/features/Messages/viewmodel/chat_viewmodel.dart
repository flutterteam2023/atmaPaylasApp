// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Messages/models/feed_information_for_chat_model.dart';
import 'package:atma_paylas_app/features/Messages/models/message_model.dart';
import 'package:atma_paylas_app/features/Messages/models/message_type_enum.dart';
import 'package:atma_paylas_app/helpers/image_picker_helper.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel({required this.channel}) {
    listenToMessages();
  }

  final WebSocketChannel channel;

  List<MessageModel> messages = [];
  FeedInformationForChatModel? feedInformationForChatModel;
  final dateFormat = DateFormat('HH:mm:ss dd-MM-yyyy');
  void listenToMessages() {
    channel.stream.listen((message) {
      Log.success('$message', path: 'ChatViewModel.listenToMessages');
      final messageMap = json.decode(message.toString()) as Map<String, dynamic>;
      Log.success('$messageMap', path: 'ChatViewModel.listenToMessages messageMap');
      // Mesaj geçmişi için
      if (messageMap['type'] == 'message_history') {
        final messagesList = messageMap['messages'] as List<dynamic>;

        messages = messagesList.map((e) {
          e as Map<String, dynamic>;
          if (messageTypefromJson(e['type'] as String) == MessageType.text) {
            return MessageModel(
              isMyMessage: e['username'] == GetIt.I<UserRepository>().user?.username,
              message: e['content'] as String,
              type: messageTypefromJson(e['type'] as String),
              messageId: e['message_id'] as int,
              timestamp: dateFormat.parse(e['timestamp'] as String),
            );
          } else {
            return MessageModel(
              isMyMessage: e['username'] == GetIt.I<UserRepository>().user?.username,
              message: "https://atmapaylas.com.tr${e['url'] as String}",
              type: messageTypefromJson(e['type'] as String),
              messageId: e['message_id'] as int,
              timestamp: dateFormat.parse(e['timestamp'] as String),
            );
          }
        }).toList();

        // Listing bilgilerini güncelle
        if (messageMap['listing_details'] != null) {
          feedInformationForChatModel =
              FeedInformationForChatModel.fromJson(messageMap['listing_details'] as Map<String, dynamic>);
        }
      }
      // Yeni mesaj için
      //{message: {type: text, username: iberke, message: Yeni mesaj 1, message_id: 202, timestamp: 16:17:43 20-02-2024}}
      else if (messageMap.containsKey('message')) {
        final newMessageMap = messageMap['message'] as Map<String, dynamic>;
        if (messageTypefromJson(newMessageMap['type'] as String) == MessageType.text) {
          final newMessage = MessageModel(
            isMyMessage: newMessageMap['username'] == GetIt.I<UserRepository>().user?.username,
            message: newMessageMap['message'] as String,
            type: messageTypefromJson(newMessageMap['type'] as String),
            messageId: newMessageMap['message_id'] as int,
            timestamp: dateFormat.parse(newMessageMap['timestamp'] as String),
          );
          messages.insert(0, newMessage);
        }

        if (messageTypefromJson(newMessageMap['type'] as String) == MessageType.image) {
          final newMessage = MessageModel(
            isMyMessage: newMessageMap['username'] == GetIt.I<UserRepository>().user?.username,
            message: "https://atmapaylas.com.tr${newMessageMap['url'] as String}",
            type: messageTypefromJson(newMessageMap['type'] as String),
            messageId: newMessageMap['message_id'] as int,
            timestamp: dateFormat.parse(newMessageMap['timestamp'] as String),
          );
          messages.insert(0, newMessage);
        }
      }
      messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      // UI'ı güncellemek için dinleyicilere haber ver
      notifyListeners();
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void clearMessages() {
    messages.clear();
    notifyListeners();
  }

  void sendMessage(String message) {
    final messageMap = {
      'type': 'text',
      'message': message,
    };
    channel.sink.add(json.encode(messageMap));
  }

  Future<void> sendImage() async {
    final photoPath = await pickFile(
      type: FileType.image,
      onFileLoading: (p0) async {},
    );
    if (photoPath != null) {
      final file = File(photoPath);
      final bytes = await file.readAsBytes();
      channel.sink.add(bytes);
    }
  }
}
      ///Mesajlaşma ekranı ilk açıldığında gelen veri şu formatta
            /// {
            ///   type: message_history,
            ///   messages: [
            ///     {
            ///       type: text,
            ///       username: iberke,
            ///       timestamp: 16:17:43 20-02-2024,
            ///       message_id: 202,
            ///       content: Yeni mesaj 1
            ///     },
            ///     {
            ///       type: text,
            ///       username: iberke,
            ///       timestamp: 15:57:46 20-02-2024,
            ///       message_id: 201,
            ///       content: 4
            ///     }
            ///   ],
            ///   other_user_details: {
            ///     user_id: 3,
            ///     username: iberke,
            ///     name: Berke,
            ///     surname: Uğurlu,
            ///     user_located_city: Konya,
            ///     user_located_district: Güneysınır,
            ///     profile_image: /media/profile_images/6c52cb9b140e491c84a0c2efed2ada2f.jpg
            ///   },
            ///   listing_details: {
            ///     listing_id: 24,
            ///     title: Takas İlanı deneemsi,
            ///     listing_type: tradable,
            ///     created_at: 2023-12-31 21:43:16,
            ///     image1_url: null
            ///   }
            /// }
            /// Yeni mesaj geldiğinde data = {message: {type: text, username: iberke, message: Yeni mesaj 1, message_id: 202, timestamp: 16:17:43 20-02-2024}} şeklinde oluyor.