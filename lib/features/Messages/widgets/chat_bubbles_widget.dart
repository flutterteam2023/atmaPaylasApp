// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Messages/models/user_message_model.dart';
import 'package:flutter/material.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(AppColors.primaryColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 13.5,
            horizontal: 18,
          ),
          margin: const EdgeInsets.only(
            right: 18,
            bottom: 18,
            left: 18,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}

class MyImageMessage extends StatelessWidget {
  const MyImageMessage({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(AppColors.primaryColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          margin: const EdgeInsets.only(
            right: 18,
            bottom: 18,
            left: 18,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OtherMessageView extends StatelessWidget {
  const OtherMessageView({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(AppColors.primaryLightColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13.5, horizontal: 18),
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 18,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: Text(
              message,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}

class OtherImageView extends StatelessWidget {
  const OtherImageView({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(AppColors.primaryLightColor),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          margin: const EdgeInsets.only(
            left: 18,
            right: 18,
            bottom: 18,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
