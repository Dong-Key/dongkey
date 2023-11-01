import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraVerificationPage extends StatefulWidget {
  @override
  _CameraVerificationPageState createState() => _CameraVerificationPageState();
}

class _CameraVerificationPageState extends State<CameraVerificationPage> {
  File _image = File('path_to_default_image.jpg');

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('학생인증'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.camera); // Pass ImageSource.camera
              },
              child: Text('카메라로 학생증을 인증해주세요.'),
            ),
            showImage(),
          ],
        ),
      ),
    );
  }

  Widget showImage() {
    if (_image == null) {
      return Container();
    } else {
      return Image.file(_image);
    }
  }
}
