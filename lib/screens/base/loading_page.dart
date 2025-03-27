import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Blue background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/sewa-mitra-logo.png', // Your logo image
                height: 100.0, // Adjust size of the circular image
                width: 100.0,  // Adjust size of the circular image
                fit: BoxFit.cover, // Ensures the image is properly scaled
              ),
            ),
            const SizedBox(height: 20), // Space between logo and text
            const Text(
              'SewaMitra', // The text to display
              style: TextStyle(
                fontSize: 36, // Increased font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.white, // White text color
                fontFamily: 'Arial', // Font family (default, you can change if needed)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
