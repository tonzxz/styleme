import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picking
import 'package:styleme_thesis/pages/classified.dart'; // Assuming this is your result page

class UploadGallery extends StatefulWidget {
  @override
  _UploadGalleryState createState() => _UploadGalleryState();
}

class _UploadGalleryState extends State<UploadGallery> {
  File? _imageFile;
  dynamic _recognition;
  bool shouldRetake = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadModel().then((_) => _pickImage());
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/model.tflite",
      labels: "assets/model/labels.txt",
    );
  }

  Future _classifyImage(File file) async {
    List<int> IMAGE_SIZE = [800, 800];
    var image = img.decodeImage(file.readAsBytesSync());
    image = img.flipVertical(image!);
    var reduced =
        img.copyResize(image, width: IMAGE_SIZE[0], height: IMAGE_SIZE[1]);
    final jpg = img.encodeJpg(reduced);
    File preprocessed = file.copySync("${file.path}(labeld).jpg");
    preprocessed.writeAsBytesSync(jpg);

    var recognitions = await Tflite.runModelOnImage(
      path: preprocessed.path,
      numResults: 1,
      threshold: 0.2,
    );
    print(recognitions);
    return recognitions;
  }

  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true; // Show loading indicator and hide content
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      _classifyImage(_imageFile!).then((prediction) {
        if (shouldRetake) {
          shouldRetake = false;
          return;
        }
        setState(() {
          _recognition = prediction;
          _isLoading = false; // Hide loading, show content again
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassifiedScreen(
              imagePath: _imageFile!.path,
              recognition: _recognition,
            ),
          ),
        );
      });
    } else {
      // Handle the case where the user cancels image selection
      setState(() {
        _isLoading = false; // Ensure content is shown again
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading // Conditional rendering based on loading state
          ? const Center(
              child: Text(
                "Nothing",
                style: TextStyle(
                    color: Colors.white), // Set the text color to white
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_imageFile != null) Image.file(_imageFile!),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Upload Image from Gallery'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
