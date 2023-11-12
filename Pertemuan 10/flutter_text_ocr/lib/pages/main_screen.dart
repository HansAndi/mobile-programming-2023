import 'package:flutter/material.dart';
import 'package:flutter_text_ocr/pages/result_screen.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'dart:io';

late List<CameraDescription> cameras;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isPermissionGranted = false;

  late final Future<void> _future;
  final TextRecognizer textRecognizer = TextRecognizer();

  // late CameraController _cameraController;
  bool showFocusCircle = false;
  double x = 0;
  double y = 0;

  // Add this controller to be able to control de camera
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();

    _future = _requestCameraPermission();
  }

  // We should stop the camera once this widget is disposed
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    _stopCamera();
    textRecognizer.close();
    super.dispose();
  }

  // Starts and stops the camera according to the lifecycle of the app
  // @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        _cameraController != null &&
        _cameraController!.value.isInitialized) {
      _startCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Stack(
          children: [
            if (_isPermissionGranted)
              FutureBuilder<List<CameraDescription>>(
                future: availableCameras(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _initCameraController(snapshot.data!);

                    return Center(child: CameraPreview(_cameraController!));
                  } else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
            Scaffold(
              appBar: AppBar(
                title: const Text('Text Recognition Sample'),
              ),
              backgroundColor: _isPermissionGranted ? Colors.transparent : null,
              body: _isPermissionGranted
                  ? Column(
                      children: [
                        // Center(child: CameraPreview(_cameraController)),
                        // if (showFocusCircle)
                        //   Positioned(
                        //     top: y - 20,
                        //     left: x - 20,
                        //     child: Container(
                        //       height: 40,
                        //       width: 40,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         border: Border.all(
                        //             color: Colors.white, width: 1.5),
                        //       ),
                        //     ),
                        //   ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: _scanImage,
                              child: const Text('Scan text'),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: const Text(
                          'Camera permission denied',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }

  void _startCamera() {
    if (_cameraController != null) {
      _cameraSelected(_cameraController!.description);
    }
  }

  void _stopCamera() {
    if (_cameraController != null) {
      _cameraController?.dispose();
    }
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) {
      return;
    }

    // Select the first rear camera.
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }

    if (camera != null) {
      _cameraSelected(camera);
    }
  }

  // Future<void> _onTap(TapUpDetails details) async {
  //   if (_cameraController!.value.isInitialized) {
  //     showFocusCircle = true;
  //     x = details.localPosition.dx;
  //     y = details.localPosition.dy;

  //     double fullWidth = MediaQuery.of(context).size.width;
  //     double cameraHeight = fullWidth * _cameraController!.value.aspectRatio;

  //     double xp = x / fullWidth;
  //     double yp = y / cameraHeight;

  //     Offset point = Offset(xp, yp);
  //     if (point != null &&
  //         (point.dx < 0 || point.dx > 1 || point.dy < 0 || point.dy > 1)) {
  //       throw ArgumentError(
  //           'The values of point should be anywhere between (0,0) and (1,1).');
  //     }
  //     print("point : $point");

  //     // Manually focus
  //     await _cameraController!.setFocusPoint(point);

  //     // Manually set light exposure
  //     //controller.setExposurePoint(point);

  //     setState(() {
  //       Future.delayed(const Duration(seconds: 2)).whenComplete(() {
  //         setState(() {
  //           showFocusCircle = false;
  //         });
  //       });
  //     });
  //   }
  // }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> _scanImage() async {
    if (_cameraController == null) return;

    final navigator = Navigator.of(context);

    try {
      final pictureFile = await _cameraController!.takePicture();

      final file = File(pictureFile.path);

      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);

      await navigator.push(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              ResultScreen(text: recognizedText.text),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
    }
  }
}
