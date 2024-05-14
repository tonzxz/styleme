import 'dart:io';
import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:styleme_thesis/pages/mode.dart';

class ClassifiedScreen extends StatelessWidget {
  final String imagePath;
  final dynamic recognition;

  ClassifiedScreen({required this.imagePath, required this.recognition});

  @override
  Widget build(BuildContext context) {
    // Image Paths (Replace with your actual image paths)
    const Map<String, List<Map<String, String>>> shapeImages = {
      'Heart': [
        {
          'image': 'assets/images/heart/Tousled Deconstructed Bob.jpg',
          'name': 'Tousled Deconstructed Bob'
        },
        {
          'image': 'assets/images/heart/Side-Swept Bangs.jpg',
          'name': 'Side-Swept Bangs'
        },
        {
          'image': 'assets/images/heart/Long Wavy Layers with Side-Cut.jpg',
          'name': 'Long Wavy Layers with Side-Cut'
        },
        {
          'image': 'assets/images/heart/Flipped-Out Lob with Center Part.jpg',
          'name': 'Flipped-Out Lob with Center Part'
        },
        {
          'image': 'assets/images/heart/Brow-Gazing Fringes.jpg',
          'name': 'Brow-Gazing Fringes'
        },
        {
          'image': 'assets/images/heart/Blunt Bangs and Wavy Layers.jpg',
          'name': 'Blunt Bangs and Wavy Layers'
        },
      ],
      'Oblong': [
        {
          'image': 'assets/images/oblong/Bouncy Blowout.jpg',
          'name': 'Bouncy Blowout'
        },
        {
          'image': 'assets/images/oblong/Chin-Length Bob.jpg',
          'name': 'Chin-Length Bob'
        },
        {
          'image': 'assets/images/oblong/Faux Curtain Bangs.jpg',
          'name': 'Faux Curtain Bangs'
        },
        {
          'image': 'assets/images/oblong/Long Face-Framing Layers.jpg',
          'name': 'Long Face-Framing Layers'
        },
        {
          'image': 'assets/images/oblong/Piecey Pixie.jpg',
          'name': 'Piecey Pixie'
        },
        {'image': 'assets/images/oblong/Soft Waves.jpg', 'name': 'Soft Waves'},
      ],
      'Oval': [
        {
          'image': 'assets/images/oval/Beachy Waves.jpg',
          'name': 'Beachy Waves'
        },
        {'image': 'assets/images/oval/Blunt Bob.jpg', 'name': 'Blunt Bob'},
        {
          'image': 'assets/images/oval/Modern Mullet.jpg',
          'name': 'Modern Mullet'
        },
        {'image': 'assets/images/oval/Modern Shag.jpg', 'name': 'Modern Shag'},
        {
          'image': 'assets/images/oval/Shoulder Length Waves.jpg',
          'name': 'Shoulder Length Waves'
        },
        {
          'image': 'assets/images/oval/Side-Swept Pixie.jpg',
          'name': 'Side-Swept Pixie'
        },
      ],
      'Round': [
        {
          'image': 'assets/images/round/Lob and Long Bangs.jpg',
          'name': 'Lob and Long Bangs'
        },
        {
          'image': 'assets/images/round/Minimal Layers.jpg',
          'name': 'Minimal Layers'
        },
        {'image': 'assets/images/round/Pixie Cut.jpg', 'name': 'Pixie Cut'},
        {'image': 'assets/images/round/Shaggy Bob.jpg', 'name': 'Shaggy Bob'},
        {
          'image': 'assets/images/round/Soft Face-Framing Layers.jpg',
          'name': 'Soft Face-Framing Layers'
        },
        {
          'image': 'assets/images/round/Swoopy Bangs.jpg',
          'name': 'Swoopy Bangs'
        },
      ],
      'Square': [
        {
          'image': 'assets/images/square/Blunt Chin-Length Layers.jpg',
          'name': 'Blunt Chin-Length Layers'
        },
        {
          'image': 'assets/images/square/Curly Bob Haircut.jpg',
          'name': 'Curly Bob '
        },
        {
          'image': 'assets/images/square/italian bob haircut.jpg',
          'name': 'Italian Bob'
        },
        {
          'image': 'assets/images/square/long layers with fringe haircut.jpg',
          'name': 'Long Layers with Fringe'
        },
        {
          'image': 'assets/images/square/Tousled Lob Haircut.jpg',
          'name': 'Tousled Lob'
        },
        {
          'image':
              'assets/images/square/long lob with curtain bangs and choppy layers haircut.jpg',
          'name': 'Long Bob'
        },
      ],
    };

    // Recognized Shape (with error handling)
    String recognizedShape = 'Unknown';
    if (recognition != null && recognition.isNotEmpty) {
      try {
        recognizedShape = recognition[0]["label"];
      } catch (e) {
        print('Error parsing recognition data: $e');
      }
    }

    List<Map<String, String>> imageList = shapeImages[recognizedShape] ?? [];

    void _showImageModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Stack(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 3 / 4,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Face Shape Text
                      Center(
                        child: Text(
                          '${recognition[0]["label"]} Face Shape',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: gradient2Color,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            final imageMap = imageList[index];
                            final imagePath = imageMap['image'];
                            final imageName = imageMap['name'];

                            // Error handling for missing image data
                            if (imagePath == null || imageName == null) {
                              return const Center(
                                child: Text('Image data missing'),
                              );
                            }

                            return Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: SizedBox(
                                      height: 40,
                                      width: 140,
                                      child: Image.asset(
                                        imagePath,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 40,
                                  child: Text(
                                    imageName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize:
                                          14, // Assuming textSM is defined elsewhere
                                      fontWeight: FontWeight.bold,
                                      color: gradient2Color,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // Close button
                top: 113,
                right: 25,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: gradient2Color,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            if (imageList.isNotEmpty) ...[
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    '${recognition[0]["label"]} Face Shape',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: gradient2Color, // Choose your desired color
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(File(imagePath)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: imageList.isNotEmpty
                      ? () => _showImageModal(context)
                      : null, // Open modal if images exist
                  style: ElevatedButton.styleFrom(
                    backgroundColor: gradient2Color,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Recommended Hair Styles',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: fontMD,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ] else ...[
              const Text('No classification result available'),
            ],

            // Retake button
            IconButton(
              onPressed: () {
                // Navigate to mode.dart
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyMode()),
                );
              },
              icon: const Icon(Icons.refresh, size: 30),
              color: gradient2Color,
            ),
          ],
        ),
      ),
    );
  }
}
