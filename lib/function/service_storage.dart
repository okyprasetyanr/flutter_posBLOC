import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class ServiceStorage {
  final storage = FirebaseStorage.instance;

  Future<String> uploadItemImage(File file, String itemId) async {
    final ref = storage.ref().child("item_images/$itemId.jpg");
    final uploadTask = await ref.putFile(file);
    final url = await uploadTask.ref.getDownloadURL();

    return url;
  }
}
