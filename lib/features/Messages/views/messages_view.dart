// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Messages/viewmodel/messages_viewmodel.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@RoutePage()
class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  late WebSocketChannel channel;
  late MessagesViewModel viewModel;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
      'wss://atmapaylas.com.tr/ws/message_previews/${GetIt.instance<AuthRepository>().lastAccessToken}/',
    );
    viewModel = MessagesViewModel(channel: channel);

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
    final roooms = viewModel.messages;

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Mesajlar'),
        ),
        body: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            if (roooms.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.message,
                      size: 100,
                      color: Color(AppColors.primaryColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9),
                      child: Text(
                        'Hiç mesaj bulunamadı.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: roooms.length,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await const FlutterSecureStorage().read(key: 'access_token').then((value) {
                      if (value != null) {
                        context.pushRoute(
                          ChatRoomRoute(
                            userName: roooms[index].otherUser.username,
                            accessToken: value,
                            feedId: null,
                            userId: roooms[index].otherUser.id,
                          ),
                        );
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (roooms[index].listing != null)
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image.network(
                                    roooms[index].listing!.image1Url ??
                                        'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
                                    height: 64,
                                    width: 64,
                                    fit: BoxFit.cover,
                                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                      if (wasSynchronouslyLoaded) {
                                        return child;
                                      }
                                      return AnimatedOpacity(
                                        opacity: frame == null ? 0 : 1,
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.easeOut,
                                        child: child,
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox(
                                        height: 64,
                                        width: 64,
                                        child: Icon(Icons.error),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (roooms[index].otherUser.profileImage != null)
                                CircleAvatar(
                                  radius: 12,
                                  backgroundImage: NetworkImage(roooms[index].otherUser.profileImage!),
                                ),
                              if (roooms[index].otherUser.profileImage == null)
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const CircleAvatar(
                                    radius: 12,
                                    backgroundImage: AssetImage('assets/images/persondemo.png'),
                                  ),
                                ),
                            ],
                          ),
                        if (roooms[index].listing == null && roooms[index].otherUser.profileImage != null)
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(roooms[index].otherUser.profileImage!),
                          ),
                        if (roooms[index].listing == null && roooms[index].otherUser.profileImage == null)
                          const CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage('assets/images/persondemo.png'),
                          ),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${roooms[index].otherUser.name} ${roooms[index].otherUser.surname}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                //roooms[index].latestMessage!.content bu verinin tipini kontrol et

                                if (roooms[index].latestMessage != null &&
                                    roooms[index].latestMessage!.content != '[Image]')
                                  Text(
                                    roooms[index].latestMessage!.content,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                if (roooms[index].latestMessage != null &&
                                    roooms[index].latestMessage!.content == '[Image]')
                                  const Text(
                                    'Fotoğraf',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            '${roooms[index].latestMessage!.timestamp.hour < 10 ? "0${roooms[index].latestMessage!.timestamp.hour}" : roooms[index].latestMessage!.timestamp.hour}:${roooms[index].latestMessage!.timestamp.minute < 10 ? "0${roooms[index].latestMessage!.timestamp.minute}" : roooms[index].latestMessage!.timestamp.minute}',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

class DevelopingWidget extends StatelessWidget {
  const DevelopingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.developer_mode,
            size: 100,
          ),
          Text(
            'Geliştiriliyor',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
