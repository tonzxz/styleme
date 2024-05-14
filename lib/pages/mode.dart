import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:styleme_thesis/pages/home.dart';
import 'package:styleme_thesis/pages/camera.dart';
import 'package:styleme_thesis/pages/upload.dart';

class MyMode extends StatelessWidget {
  const MyMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // Use the appBar's leading property
          icon: Icon(Icons.arrow_back, color: gradient2Color, size: 35),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHome()),
            );
          },
        ),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove the app bar's shadow
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 150, // Adjust the icon size as needed
              icon:
                  const Icon(Icons.camera_alt_outlined, color: gradient2Color),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CameraPage()),
                );
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              iconSize: 150, // Adjust the icon size as needed
              icon: const Icon(Icons.photo, color: gradient2Color),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadGallery()),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
