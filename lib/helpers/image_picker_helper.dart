import 'package:file_picker/file_picker.dart';

Future<String?> pickFile({
  String? dialogTitle,
  String? initialDirectory,
  FileType type = FileType.any,
  List<String>? allowedExtensions,
  dynamic Function(FilePickerStatus)? onFileLoading,
  bool allowCompression = true,
  bool allowMultiple = false,
  bool withData = false,
  bool withReadStream = false,
  bool lockParentWindow = false,
  bool readSequential = false,
}) async {
  final result = await FilePicker.platform.pickFiles(
    dialogTitle: dialogTitle,
    initialDirectory: initialDirectory,
    type: type,
    allowedExtensions: allowedExtensions,
    onFileLoading: onFileLoading,
    allowCompression: allowCompression,
    allowMultiple: allowMultiple,
    withData: withData,
    withReadStream: withReadStream,
    lockParentWindow: lockParentWindow,
    readSequential: readSequential,
  );
  if (result != null) {
    // Kullanıcı dosya seçerse, dosyanın tam yolunu döndür
    return result.files.single.path;
  } else {
    // Kullanıcı dosya seçmezse veya seçim iptal edilirse null döndür
    return null;
  }
}
