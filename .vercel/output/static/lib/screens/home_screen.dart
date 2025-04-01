import 'package:flutter/material.dart';
import 'package:sewamitra/screens/base/home_page.dart';
import 'package:sewamitra/screens/base/loading_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Future.delayed to navigate after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to HomePage after 2 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    // Show the LoadingPage initially
    return const LoadingPage();
  }
}
