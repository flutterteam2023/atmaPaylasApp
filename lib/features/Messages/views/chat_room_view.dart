import 'dart:convert';

import 'package:atma_paylas_app/features/Messages/models/user_message_model.dart';
import 'package:atma_paylas_app/features/Messages/widgets/chat_bubbles_widget.dart';
import 'package:atma_paylas_app/features/Messages/widgets/send_message_widget.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@RoutePage()
class ChatRoomView extends StatefulWidget {
  const ChatRoomView({
    required this.userName,
    required this.accessToken,
    super.key,
  });
  final String userName;
  final String accessToken;
  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  late WebSocketChannel channel;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
      'wss://atmapaylas.com.tr/ws/chat/${widget.accessToken}/${widget.userName}/',
    );
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  List<Map<String, dynamic>> messages = <Map<String, dynamic>>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      bottomNavigationBar: SendMessageField(otherUser: widget.userName, socket: channel),
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final data = jsonDecode(snapshot.data.toString());

            if (data['type'] != null) {
              print((data as Map<String, dynamic>)['type']);
              for (final element in data['messages'] as List<dynamic>) {
                messages.add(element as Map<String, dynamic>);
              }
              print(messages);
            } else {
              messages.insert(0, data['message'] as Map<String, dynamic>);
              print(messages);
            }
            return ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final x = <UserMessage>[];
                messages.forEach((element) {
                  x.add(UserMessage(
                    username: element["username"] as String,
                    content: Content(
                        type: element["type"] as String,
                        text: element["content"] as String? ?? element["message"] as String? ?? "imposible"),
                    timestamp: element["timestamp"] as String? ?? DateTime.now().toIso8601String(),
                    otherUsername: element["username"] as String == GetIt.instance<UserRepository>().user?.username
                        ? GetIt.instance<UserRepository>().user?.username
                        : element["username"] as String,
                  ));
                });
                if (x[index].username == GetIt.instance<UserRepository>().user?.username) {
                  return MyMessageWidget(item: x[index]);
                } else {
                  return OtherMessageView(item: x[index]);
                }
                return Text((messages[index]['content'] ?? messages[index]).toString());
              },
            );
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
