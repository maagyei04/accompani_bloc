import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageGallery() async {
  try {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      return File(imagePicked.path);
    }

    return File('assets/logo/accompani.png');
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageGallery2() async {
  try {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      return File(imagePicked.path);
    }

    return File('assets/logo/accompani.png');
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageGallery3() async {
  try {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imagePicked != null) {
      return File(imagePicked.path);
    }

    return File('assets/logo/accompani.png');
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageCamera() async {
  try {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      return File(imagePicked.path);
    }

    return File('assets/logo/accompani.png');
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageCamera2() async {
  try {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      return File(imagePicked.path);
    }

    return File('assets/logo/accompani.png');
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageCamera3() async {
  try {
    final imagePicked =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imagePicked != null) {
      return File(imagePicked.path);
    }

    return File('assets/logo/accompani.png');
  } catch (e) {
    return null;
  }
}
