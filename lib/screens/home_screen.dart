import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewamitra/services/firebase_auth_methods.dart';
import 'package:sewamitra/widgets/custom_button.dart';
import 'package:sewamitra/screens/base/home_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key?key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
