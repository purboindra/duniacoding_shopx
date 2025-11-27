import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class ImageHelper {
  ImageHelper._privateConstructor();

  static final ImageHelper _instance = ImageHelper._privateConstructor();

  static ImageHelper get instance => _instance;

  Future<String> writeImageToFile(Uint8List bytes, {String? filename}) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File(
      '${tempDir.path}/${filename ?? 'ml_${DateTime.now().millisecondsSinceEpoch}.webp'}',
    );
    await tempFile.writeAsBytes(bytes);
    return tempFile.path;
  }

  String defaultImageUrl =
      "https://www.gravatar.com/avatar/000000000000000000000000000000?d=mp&f=y";
}
