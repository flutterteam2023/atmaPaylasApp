// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Messages/models/feed_information_for_chat_model.dart';
import 'package:atma_paylas_app/features/Messages/models/user_message_model.dart';
import 'package:atma_paylas_app/features/Messages/widgets/chat_bubbles_widget.dart';
import 'package:atma_paylas_app/features/Messages/widgets/send_message_widget.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
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
    required this.feedId,
    super.key,
  });
  final String userName;
  final String accessToken;
  final String? feedId;
  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  late WebSocketChannel channel;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
      'wss://atmapaylas.com.tr/ws/chat/${widget.accessToken}/${widget.userName}/${widget.feedId == null ? "" : "${widget.feedId}/"}',
    );
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  List<Map<String, dynamic>> messages = <Map<String, dynamic>>[];
  FeedInformationForChatModel? feedInformationForChatModel;

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
            print(data['listing_details']);
            if (data['type'] != null) {
              print((data as Map<String, dynamic>)['type']);
              for (final element in data['messages'] as List<dynamic>) {
                messages.add(element as Map<String, dynamic>);
              }
              feedInformationForChatModel = data['listing_details'] != null
                  ? FeedInformationForChatModel.fromJson(data['listing_details'] as Map<String, dynamic>)
                  : null;
              print(messages);
            } else {
              messages.insert(0, data['message'] as Map<String, dynamic>);
              print(messages);
            }

            return Scaffold(
              appBar: feedInformationForChatModel == null
                  ? null
                  : AppBar(
                      toolbarHeight: 0,
                      bottom: PreferredSize(
                        preferredSize: Size(
                          MediaQuery.of(context).size.width,
                          72,
                        ),
                        child: InkWell(
                          onTap: () {
                            context.pushRoute(AdsDetailRoute(id: feedInformationForChatModel!.listingId));
                          },
                          child: Container(
                            color: const Color(AppColors.primaryLightColor),
                            child: ListTile(
                              title: Text(
                                feedInformationForChatModel?.title ?? 'null',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 9),
                                    decoration: BoxDecoration(
                                      color: feedInformationForChatModel?.listingType == ListingTypes.free.name
                                          ? const Color(0xff6DCEBB)
                                          : const Color(0xffFD8435),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Text(
                                      feedInformationForChatModel?.listingType == ListingTypes.free.name
                                          ? 'Ücretsiz Paylaşılıyor'
                                          : 'Takaslanıyor',
                                      style: TextStyle(
                                        color: feedInformationForChatModel?.listingType == ListingTypes.free.name
                                            ? const Color(0xff05473A)
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                radius: 32,
                                backgroundImage: NetworkImage(
                                  feedInformationForChatModel?.image1Url ?? 'null',
                                ),
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      ),
                    ),
              body: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final x = <UserMessage>[];
                  messages.forEach((element) {
                    x.add(
                      UserMessage(
                        username: element['username'] as String,
                        content: Content(
                          type: element['type'] as String,
                          text: element['content'] as String? ?? element['message'] as String? ?? 'imposible',
                        ),
                        timestamp: element['timestamp'] as String? ?? DateTime.now().toIso8601String(),
                        otherUsername: element['username'] as String == GetIt.instance<UserRepository>().user?.username
                            ? GetIt.instance<UserRepository>().user?.username
                            : element['username'] as String,
                      ),
                    );
                  });
                  if (x[index].username == GetIt.instance<UserRepository>().user?.username) {
                    return MyMessageWidget(item: x[index]);
                  } else {
                    return OtherMessageView(item: x[index]);
                  }
                  return Text((messages[index]['content'] ?? messages[index]).toString());
                },
              ),
            );
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
