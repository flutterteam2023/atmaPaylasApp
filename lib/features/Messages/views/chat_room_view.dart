// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Messages/models/feed_information_for_chat_model.dart';
import 'package:atma_paylas_app/features/Messages/models/user_message_model.dart';
import 'package:atma_paylas_app/features/Messages/widgets/chat_bubbles_widget.dart';
import 'package:atma_paylas_app/features/Messages/widgets/send_message_widget.dart';
import 'package:atma_paylas_app/repositories/block_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:path/path.dart' as path;

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
  late ImagePicker _imagePicker;
  final x = <UserMessage>[];

  XFile? _selectedImage;
  @override
  void initState() {
    channel = IOWebSocketChannel.connect(
      'wss://atmapaylas.com.tr/ws/chat/${widget.accessToken}/${widget.userName}/${widget.feedId == null ? "" : "${widget.feedId}/"}',
    );
    _imagePicker = ImagePicker();
    super.initState();
  }

  // Future<File> pickImageFromGallery() async {
  //   // İlgili galeri seçim işlemleri burada gerçekleştirilmelidir.
  //   // Bu örneğin kapsamında değildir.
  //   // Seçilen resmi bir File olarak döndürün.
  //   // Örneğin, image_picker paketi kullanılabilir.
  //   return _imagePicker.pickMedia();
  // }

  // Future<String> saveImageToPath(File imageFile, String targetPath) async {
  //   // Hedef dizini oluştur (eğer yoksa)
  //   Directory directory = Directory(targetPath);
  //   if (!directory.existsSync()) {
  //     directory.createSync(recursive: true);
  //   }

  //   // Dosyayı kaydet
  //   String fileName = path.basename(imageFile.path);
  //   String savedImagePath = path.join(targetPath, fileName);
  //   await imageFile.copy(savedImagePath);

  //   return savedImagePath;
  // }

  // Future<void> sendImageViaWebSocket(String imagePath) async {
  //   // Resmi byte dizisine çevir
  //   File imageFile = File(imagePath);
  //   List<int> imageBytes = await imageFile.readAsBytes();

   
   
  //   // Veriyi gönder
  //   channel.sink.add(jsonEncode({'type': 'image', 'url': imageBytes}));

  //   // Bağlantıyı kapat (İşiniz bittiğinde)
  //   await channel.sink.close();
  // }
  // //  Future<void> _pickImage() async {
  // //   final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

  // //   if (pickedFile != null) {
  // //     setState(() {
  // //       _selectedImage = pickedFile;
  // //       // x.add(
  // //       //   UserMessage(
  // //       //     username: GetIt.instance<UserRepository>().user?.username ?? 'null',
  // //       //     content: Content(
  // //       //       type: 'image',
  // //       //       text: _selectedImage!.path,
  // //       //     ),
  // //       //     timestamp: DateTime.now().toIso8601String(),
  // //       //     otherUsername: GetIt.instance<UserRepository>().user?.username ?? 'null',
  // //       //     url: _selectedImage!.path,
  // //       //   ),
  // //       // );
  // //       channel.sink.add(jsonEncode({'type': 'image', 'url': _selectedImage!.path}));

  // //       print(_selectedImage!.path);
  // //     });
  // //   }
  // // }

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
        actions: [
          IconButton(
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
          ),
        ],
      ),
      bottomNavigationBar: SendMessageField(
        otherUser: widget.userName,
        socket: channel,
        onTap: ()  {
          
        },
      ),
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
                        url: element['url'] as String? ?? '',
                      ),
                    );
                  });
                  if (x[index].username == GetIt.instance<UserRepository>().user?.username) {
                    if (x[index].content.type == 'image') {
                      return MyImageMessage(item: x[index]);
                    } else if (x[index].content.type == 'text') {
                      return MyMessageWidget(item: x[index]);
                    }
                  } else {
                    if (x[index].content.type == 'image') {
                      return OtherImageView(item: x[index]);
                    } else if (x[index].content.type == 'text') {
                      return OtherMessageView(item: x[index]);
                    }
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
