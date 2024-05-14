import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:styleme_thesis/styles.dart';
import 'package:styleme_thesis/pages/mode.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
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

  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      performanceMode: FaceDetectorMode.fast,
    ),
  );

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    closerModel();
    _faceDetector.close();

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
      // Wait for the camera controller to initialize
      await _initializeControllerFuture;

      // Turn off the flash
      await _controller!.setFlashMode(FlashMode.off);

      // Show a loading dialog while processing
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      // Capture the image
      final capturedImage = await _controller!.takePicture();
      File? image = File(capturedImage.path);

      // Create an InputImage from the captured image
      InputImage inputImage = InputImage.fromFile(image);

      // Process the image to detect faces
      final List<Face> faces = await _faceDetector.processImage(inputImage);

      // If faces are detected, proceed with classification
      if (faces.isNotEmpty) {
        _classifyImage(image).then((prediction) {
          // Check if the image should be retaken
          if (shouldRetake) {
            shouldRetake = false; // Reset the flag
            Navigator.of(context).pop(); // Close the loading dialog
            return;
          }

          // Update the UI with the classification result
          setState(() {
            _recognition = prediction;
          });

          // Resume camera preview after a short delay
          Timer(const Duration(milliseconds: 500), () {
            _controller?.resumePreview();
          });

          // Close the loading dialog
          Navigator.of(context).pop();

          // Navigate to the classification results screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClassifiedScreen(
                imagePath: capturedImage.path,
                recognition: _recognition,
                mode: 'camcam',
              ),
              settings: RouteSettings(arguments: shouldRetake),
            ),
          ).then((shouldRetakeValue) {
            // Get the value when navigating back
            if (shouldRetakeValue != null) {
              shouldRetake = shouldRetakeValue;
            }
          });
        }).catchError((error) {
          // Handle errors during classification
          print('Error during classification: $error');
          Navigator.of(context).pop();
          _showErrorDialog('Classification Error');
        });
      } else {
        // No faces detected, close the loading dialog
        Navigator.of(context).pop();
        _showErrorDialog('No Face Detected');
      }
    } catch (e) {
      // Handle other errors during the process
      print('Error taking picture: $e');
      Navigator.of(context).pop();
      _showErrorDialog('Camera Error');
    }
  }

  void _showErrorDialog(String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: fontMD),
        )),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Customize background color
                foregroundColor: Colors.red, // Customize text color
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                textStyle: const TextStyle(fontSize: 18, fontWeight: fontMD),
              ),
              child: const Icon(
                  Icons.refresh), // Replace with reset icon (refresh)
            ),
          ),
        ],
      ),
    );
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
                  top: 50.0,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyMode()),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: gradient2Color,
                      size: 35,
                    ),
                  ),
                ),
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
