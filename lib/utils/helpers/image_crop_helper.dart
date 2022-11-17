import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageCropHelper{
//
//  static Future<XFile?> pickImageFromGallery() async {
//    return await ImagePicker().pickImage(source: ImageSource.gallery);
//  }
//  static Future<XFile?> pickImageFromCamera() async {
//    return await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 80,preferredCameraDevice:  CameraDevice.front);
//  }
//  /// Pick Image From Gallery and return a File
//  static Future<File?> cropSelectedImage(String filePath) async {
//    ImageCropper imge = ImageCropper();
//    return await imge.cropImage(
//        sourcePath: filePath,
//        aspectRatioPresets: [
//          CropAspectRatioPreset.square,
//          CropAspectRatioPreset.ratio3x2,
//          CropAspectRatioPreset.original,
//          CropAspectRatioPreset.ratio4x3,
//          CropAspectRatioPreset.ratio16x9
//        ],
//        androidUiSettings: AndroidUiSettings(
//            toolbarTitle: S.current.editPhoto,
//            toolbarColor: Colors.brown.shade600,
//            toolbarWidgetColor: Colors.white,
//            initAspectRatio: CropAspectRatioPreset.original,
//            lockAspectRatio: false),
//        iosUiSettings: IOSUiSettings(
//          minimumAspectRatio: 1.0,
//        ));
//  }
}

class ImageCompression {
  // 1. compress file and get Uint8List
  static Future<Uint8List> compressFile(File file) async {
    dynamic result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );
    print(file.lengthSync());
    print(result.length);
    return result;
  }

  // 2. compress file and get file.
  static Future<File> compressAndGetFile(
      {required File file,
        String? targetPath,
        int? minWidth,
        int? minHeight}) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    dynamic result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath != null ? targetPath : outPath,
      quality: 90,
      minWidth: minWidth != null ? minWidth : 1000,
      minHeight: minHeight != null ? minHeight : 1000,
    );
    return result;
  }

  // 3. compress asset and get Uint8List.
  static Future<Uint8List> compressAsset(String assetName) async {
    dynamic list = await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 180,
    );

    return list;
  }

  // 4. compress Uint8List and get another Uint8List.
  static Future<Uint8List> comporessList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );
    print(list.length);
    print(result.length);
    return result;
  }
}