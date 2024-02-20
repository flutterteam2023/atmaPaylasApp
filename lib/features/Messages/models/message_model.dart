// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/features/Messages/models/message_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required bool isMyMessage,
    required String message,
    required MessageType type,
    required int messageId,
    required DateTime timestamp,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
