import 'dart:convert';

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SendMessageField extends HookWidget {
  const SendMessageField({
    required this.socket,
    required this.otherUser,
    super.key,
  });

  final String otherUser;
  final WebSocketChannel socket;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.only(
            bottom: kBottomNavigationBarHeight,
            top: 18,
            right: 18,
            left: 18,
          ),
          child: Row(
            children: [
              if (false)
                IconButton(
                  onPressed: () {
                    print(otherUser);
                  },
                  icon: SvgPicture.asset('assets/svg/gallery.svg'),
                ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Message',
                      filled: true,
                      fillColor: Color(AppColors.primaryLightColor),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              ListenableBuilder(
                listenable: controller,
                builder: (context, widget) {
                  if (controller.text.isEmpty) {
                    return const SizedBox.shrink();
                  } else {
                    return IconButton(
                      onPressed: () {
                        try {
                          socket.sink.add(jsonEncode({'type': 'text', 'message': controller.text}));
                          controller.clear();
                        } catch (e) {
                          Log.error(e, path: 'socket error sending ');
                        }
                      },
                      icon: SvgPicture.asset(
                        'assets/svg/send.svg',
                        color: const Color(AppColors.primaryColor),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
