import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:styleme_thesis/pages/home.dart';
import 'package:styleme_thesis/pages/camera.dart';
import 'package:styleme_thesis/pages/upload.dart';
import 'package:styleme_thesis/pages/ip_utils.dart';

class MyMode extends StatelessWidget {
  const MyMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: gradient2Color, size: 35),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHome()),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 150,
                  icon: const Icon(Icons.camera_alt_outlined,
                      color: gradient2Color),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraPage()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                IconButton(
                  iconSize: 150,
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
          Positioned(
            bottom: 20,
            left: 20,
            child: SizedBox(
              width: 125,
              height: 125,
              child: FloatingActionButton(
                backgroundColor: Colors.white, // Change button color to white
                elevation: 0, // Remove shadow
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      String newIpAddress = '';

                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: 200, // Adjust height as needed
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'Enter IP Address'),
                                onChanged: (value) {
                                  newIpAddress = value;
                                },
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  if (newIpAddress.isNotEmpty) {
                                    await setIpAddress(newIpAddress);
                                    Navigator.pop(context); // Close the modal
                                  }
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(Icons.add,
                    color:
                        Colors.white), // Icon color set to black for visibility
              ),
            ),
          ),
        ],
      ),
    );
  }
}
