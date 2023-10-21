import 'dart:convert';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  pickImage() async {
    XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
    if (file != null) {
      imageFile = File(file.path);

      var resultFile = await FlutterImageCompress.compressWithFile(
          imageFile!.path,
          quality: 20);
      return base64Encode(resultFile!.toList());
    } else {
      return null;
    }
  }

  clickImage() async {
    XFile? file = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
    if (file != null) {
      imageFile = File(file.path);

      var resultFile = await FlutterImageCompress.compressWithFile(
          imageFile!.path,
          quality: 20);
      return base64Encode(resultFile!.toList());
    } else {
      return null;
    }
  }
}
