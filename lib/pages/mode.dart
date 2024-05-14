import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:styleme_thesis/pages/camera.dart';
import 'package:styleme_thesis/pages/upload.dart';

class MyMode extends StatelessWidget {
  const MyMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 150, // Adjust the icon size as needed
              icon: const Icon(Icons.camera_alt_outlined, color: gradient2Color),
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
          ],
        ),
      ),
    );
  }
}
