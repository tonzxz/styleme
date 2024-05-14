import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:styleme_thesis/styles.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:styleme_thesis/pages/classified.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _cameras;
  int _selectedCameraIndex = 0;
  XFile? _capturedImage;
  dynamic _recognition;
  bool shouldRetake = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    loadModel();
  }

  closerModel() async {
    await Tflite.close();
  }

  Future loadModel() async {
    await Tflite.loadModel(
        model: "assets/model/model.tflite",
        labels: "assets/model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    closerModel();
    super.dispose();
  }

  Future _classifyImage(File file) async {
    List<int> IMAGE_SIZE = [240, 240];
    var image = img.decodeImage(file.readAsBytesSync());
    image = img.flipHorizontal(image!);
    // resize image
    var reduced = img.copyResize(image,
        width: IMAGE_SIZE[0],
        height: IMAGE_SIZE[1],
        interpolation: img.Interpolation.nearest);

    final jpg = img.encodeJpg(reduced);
    File preprocessed = file.copySync("${file.path}(labeld).jpg");
    preprocessed.writeAsBytesSync(jpg);

    var recognitions = await Tflite.runModelOnImage(
        path: preprocessed.path, // required

        numResults: 1, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    print(recognitions);
    return recognitions;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    if (!mounted) return;
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras![_selectedCameraIndex],
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller!.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  void _takePicture() async {
    try {
      await _initializeControllerFuture;
      await _controller!.setFlashMode(FlashMode.off);

      // Show the loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      final capturedImage = await _controller!.takePicture();
      File? image = File(capturedImage.path);

      _classifyImage(image).then((prediction) {
        // Check the retake flag after the potential delay of image classification
        if (shouldRetake) {
          shouldRetake = false; // Reset the flag
          Navigator.of(context).pop(); // Close the loading dialog
          return;
        }

        setState(() {
          _recognition = prediction;
        });

        Timer(const Duration(milliseconds: 500), () {
          _controller?.resumePreview();
        });

        // Close the loading dialog before navigating
        Navigator.of(context).pop();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ClassifiedScreen(
                  imagePath: capturedImage.path, recognition: _recognition),
              settings:
                  RouteSettings(arguments: shouldRetake) // Set arguments here

              ),
        ).then((shouldRetakeValue) {
          // Get the value when navigating back
          if (shouldRetakeValue != null) {
            shouldRetake = shouldRetakeValue;
          }
        });
      });
    } catch (e) {
      print(e);
      Navigator.of(context).pop(); // Close the dialog in case of errors
    }
  }

  void _toggleCameraLens() {
    if (_controller != null &&
        _controller!.value.isInitialized &&
        _cameras!.length > 1) {
      setState(() {
        _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras!.length;
      });
      _initializeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Center(child: CameraPreview(_controller!)),
                Positioned(
                  bottom: 40.0,
                  right: 50,
                  child: GestureDetector(
                    onTap: _toggleCameraLens,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: const Icon(
                        Icons.flip_camera_android_outlined,
                        color: gradient2Color,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 32.0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _takePicture();
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: gradient2Color,
                        ),
                        child: Center(
                          child: Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
