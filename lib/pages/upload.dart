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
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      // Don't set _imageFile here, only store the file path
      String? pickedFilePath = pickedFile?.path;

      if (pickedFilePath != null) {
        final prediction = await _classifyImage(File(pickedFilePath));
        if (shouldRetake) {
          shouldRetake = false;
          return;
        }

        setState(() {
          _recognition = prediction;
        });

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => PopScope(
            canPop: false,
            onPopInvoked: (didPop) {},
            child: Center(child: CircularProgressIndicator()),
          ),
        );

        Future.delayed(Duration(seconds: 3)).then((value) {
          Navigator.of(context).pop(); // Dismiss the dialog
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ClassifiedScreen(
              imagePath: pickedFilePath,
              recognition: _recognition,
              mode: 'upload',
            ),
          ));
        });
      } else {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } catch (error) {
      print("Error picking image: $error");
      Navigator.pop(context);
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
