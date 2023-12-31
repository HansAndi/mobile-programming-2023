// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'preview_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CameraPage extends StatefulWidget {
//   const CameraPage({Key? key, required this.cameras}) : super(key: key);

//   final List<CameraDescription>? cameras;

//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   late CameraController _cameraController;
//   bool _isRearCameraSelected = true;

//   Future initCamera(CameraDescription cameraDescription) async {
//     _cameraController =
//         CameraController(cameraDescription, ResolutionPreset.high);
//     try {
//       await _cameraController.initialize().then((_) {
//         if (!mounted) return;
//         setState(() {});
//       });
//     } on CameraException catch (e) {
//       debugPrint("camera error $e");
//     }
//   }

//   Future<dynamic> scanImage(XFile picture) async {
//     var request = http.MultipartRequest('POST',
//         Uri.parse('https://ridwanrizqi64.pythonanywhere.com/extract_info'));

//     request.files.add(http.MultipartFile.fromBytes(
//         'file', File(picture.path).readAsBytesSync(),
//         filename: picture.name));

//     var res = await request.send();

//     var response = await http.Response.fromStream(res);

//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       return jsonResponse;
//     } else {
//       print('Request failed with status: ${response.statusCode}.');
//     }
//   }

//   Future takePicture() async {
//     if (!_cameraController.value.isInitialized) {
//       return null;
//     }
//     if (_cameraController.value.isTakingPicture) {
//       return null;
//     }
//     try {
//       await _cameraController.setFlashMode(FlashMode.off);
//       XFile picture = await _cameraController.takePicture();
//       var extractedData = await scanImage(picture);
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => PreviewPage(
//       //       picture: picture,
//       //       data: extractedData,
//       //     ),
//       //   ),
//       // );
//     } on CameraException catch (e) {
//       debugPrint('Error occured while taking picture: $e');
//       return null;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // initialize the rear camera
//     initCamera(widget.cameras![0]);
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _cameraController.dispose();
//     super.dispose();
//   }

//   String url = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             (_cameraController.value.isInitialized)
//                 ? CameraPreview(_cameraController)
//                 : Container(
//                     color: Colors.black,
//                     child: const Center(child: CircularProgressIndicator()),
//                   ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.20,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(24),
//                     ),
//                     color: Colors.black),
//                 child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: IconButton(
//                           padding: EdgeInsets.zero,
//                           iconSize: 30,
//                           icon: Icon(
//                               _isRearCameraSelected
//                                   ? CupertinoIcons.switch_camera
//                                   : CupertinoIcons.switch_camera_solid,
//                               color: Colors.white),
//                           onPressed: () {
//                             setState(() =>
//                                 _isRearCameraSelected = !_isRearCameraSelected);
//                             initCamera(
//                                 widget.cameras![_isRearCameraSelected ? 0 : 1]);
//                           },
//                         ),
//                       ),
//                       Expanded(
//                           child: IconButton(
//                         onPressed: takePicture,
//                         iconSize: 50,
//                         padding: EdgeInsets.zero,
//                         constraints: const BoxConstraints(),
//                         icon: const Icon(Icons.circle, color: Colors.white),
//                       )),
//                       const Spacer(),
//                     ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
