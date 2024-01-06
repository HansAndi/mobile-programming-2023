import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:uas_ocr/preview_page.dart';
import 'camera_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<dynamic> scanImage(File picture) async {
  var request = http.MultipartRequest('POST',
      Uri.parse('https://ridwanrizqi64.pythonanywhere.com/extract_info'));

  request.files.add(http.MultipartFile.fromBytes(
      'file', File(picture.path).readAsBytesSync(),
      filename: picture.path.split('/').last));

  var res = await request.send();

  var response = await http.Response.fromStream(res);

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class _HomePageState extends State<HomePage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    Future _pickImageGallery() async {
      final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (returnedImage == null) return;
      setState(() {
        _image = File(returnedImage.path);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //     onPressed: () async {
              //       await availableCameras().then(
              //         (value) => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (_) => CameraPage(cameras: value)),
              //         ),
              //       );
              //     },
              //     child: const Text("Take a Picture")),
              ElevatedButton(
                onPressed: () async {
                  _pickImageGallery();
                },
                child: const Text("Pick an Image"),
              ),
              ElevatedButton(
                onPressed: () {
                  // _pickImageGallery();
                  if (_image != null) {
                    scanImage(_image!).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                PreviewPage(picture: _image, data: value)),
                      ),
                    );
                  }
                },
                child: const Text("Scan Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
