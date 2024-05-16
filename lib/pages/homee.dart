import 'package:flutter/material.dart';
import 'package:styleme_thesis/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styleme_thesis/pages/mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applicable Photos Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomee(),
    );
  }
}

class MyHomee extends StatelessWidget {
  const MyHomee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 400,
            height: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius:
                      200, // Increase blurRadius for a more pronounced shadow
                  offset: Offset(
                      0, -20), // Adjust the offset to create a top shadow
                  spreadRadius:
                      50, // Ensure spreadRadius is 0 to limit the shadow to the top
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/check.png', // Replace with your image path
                      width: 75, // Set the width according to your needs
                      height: 75, // Set the height according to your needs
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Please look at the camera directly, Ensure good lighting, Maintain a Suitable Distance, and Make sure that nothing is blocking the Face.',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ApplicableImage('assets/images/app1.png'),
                    ApplicableImage('assets/images/app2.png'),
                    ApplicableImage('assets/images/app3.png'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 450,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: const Border(
                top: BorderSide(
                    color: Color.fromARGB(255, 32, 32, 32),
                    width: 6), // Top border
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ekis.png', // Replace with your image path
                      width: 75, // Set the width according to your needs
                      height: 75, // Set the height according to your needs
                    ),
                    // Text(
                    //   'NOT APPLICABLE',
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Multiple faces, Smiling, Too far/close from the camera, Not directly looking at the camera, Poorly Lit',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NotApplicableImage('assets/images/not1.png'),
                    NotApplicableImage('assets/images/not2.png'),
                    NotApplicableImage('assets/images/not3.png'),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [gradient1Color, gradient2Color],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyMode()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Make button background transparent
                      shadowColor: Colors.transparent, // Remove shadow
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Get Started',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicableImage extends StatelessWidget {
  final String imagePath;
  ApplicableImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}

class NotApplicableImage extends StatelessWidget {
  final String imagePath;
  NotApplicableImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
