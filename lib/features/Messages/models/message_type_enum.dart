enum MessageType { text, image, video, audio, file }

MessageType messageTypefromJson(String type) {
  switch (type) {
    case 'text':
      return MessageType.text;
    case 'image':
      return MessageType.image;
    case 'video':
      return MessageType.video;
    case 'audio':
      return MessageType.audio;
    case 'file':
      return MessageType.file;
    default:
      throw Exception('Unknown type');
  }
}

extension JsonMethods on MessageType {
  String toJson() {
    switch (this) {
      case MessageType.text:
        return 'text';
      case MessageType.image:
        return 'image';
      case MessageType.video:
        return 'video';
      case MessageType.audio:
        return 'audio';
      case MessageType.file:
        return 'file';
    }
  }
}
