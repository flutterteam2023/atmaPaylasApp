import 'package:atma_paylas_app/repositories/auth_repository.dart';
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
  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
      'wss://atmapaylas.com.tr/ws/message_previews/${GetIt.instance<AuthRepository>().lastAccessToken}/',
    );
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlar'),
      ),
      body: StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          print(snapshot.data);
          return Text(
            snapshot.data.toString(),
          );
        },
      ),
    );
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
