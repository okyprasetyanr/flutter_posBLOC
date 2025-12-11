import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
  final picker = ImagePicker();

  Future<File?> pickImage() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (picked == null) return null;

    return File(picked.path);
  }
}
