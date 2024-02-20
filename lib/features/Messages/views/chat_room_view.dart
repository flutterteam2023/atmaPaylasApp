// ignore_for_file: lines_longer_than_80_chars, prefer_single_quotes, avoid_dynamic_calls

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Messages/models/message_type_enum.dart';
import 'package:atma_paylas_app/features/Messages/viewmodel/chat_viewmodel.dart';
import 'package:atma_paylas_app/features/Messages/widgets/chat_bubbles_widget.dart';
import 'package:atma_paylas_app/features/Messages/widgets/send_message_widget.dart';
import 'package:atma_paylas_app/repositories/block_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@RoutePage()
class ChatRoomView extends StatefulWidget {
  const ChatRoomView({
    required this.userName,
    required this.accessToken,
    required this.feedId,
    required this.userId,
    super.key,
  });
  final String userName;
  final String accessToken;
  final String? feedId;
  final int userId;
  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  late WebSocketChannel channel;
  late ChatViewModel viewModel;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
      'wss://atmapaylas.com.tr/ws/chat/${widget.accessToken}/${widget.userName}/${widget.feedId == null ? "" : "${widget.feedId}/"}',
    );
    viewModel = ChatViewModel(channel: channel);
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
        actions: [
          _buildOptions(context),
        ],
      ),
      bottomNavigationBar: SendMessageField(
        otherUser: widget.userName,
        socket: channel,
        onTap: () async {
          await viewModel.sendImage();
        },
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return ListView.builder(
            itemCount: viewModel.messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              if (viewModel.messages[index].type == MessageType.image) {
                if (viewModel.messages[index].isMyMessage) {
                  return MyImageMessage(imageUrl: viewModel.messages[index].message);
                } else {
                  return OtherImageView(imageUrl: viewModel.messages[index].message);
                }
              }
              if (viewModel.messages[index].isMyMessage) {
                return MyMessageWidget(message: viewModel.messages[index].message);
              } else {
                return OtherMessageView(message: viewModel.messages[index].message);
              }
            },
          );
        },
      ),
    );
  }

  IconButton _buildOptions(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              const Gap(9),
              ListTile(
                onTap: () async {
                  await GetIt.instance<BlockRepository>().addBlockUser(widget.userId).then((value) {
                    value.fold(
                      EasyLoading.showToast,
                      EasyLoading.showToast,
                    );
                  });
                },
                title: const Text('Engelle'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(),
              const ListTile(
                title: Text('Profili Gör'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Gap(MediaQuery.of(context).viewPadding.bottom),
            ],
          ),
        );
      },
      icon: const Icon(Icons.more_vert),
    );
  }

  AppBar _buildFeedInformation(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          72,
        ),
        child: InkWell(
          onTap: () {
            context.pushRoute(AdsDetailRoute(id: viewModel.feedInformationForChatModel!.listingId));
          },
          child: Container(
            color: const Color(AppColors.primaryLightColor),
            child: ListTile(
              title: Text(
                viewModel.feedInformationForChatModel?.title ?? 'null',
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
                      color: viewModel.feedInformationForChatModel?.listingType == ListingTypes.free.name
                          ? const Color(0xff6DCEBB)
                          : const Color(0xffFD8435),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      viewModel.feedInformationForChatModel?.listingType == ListingTypes.free.name
                          ? 'Ücretsiz Paylaşılıyor'
                          : 'Takaslanıyor',
                      style: TextStyle(
                        color: viewModel.feedInformationForChatModel?.listingType == ListingTypes.free.name
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
                  viewModel.feedInformationForChatModel?.image1Url ?? 'null',
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ),
    );
  }
}
