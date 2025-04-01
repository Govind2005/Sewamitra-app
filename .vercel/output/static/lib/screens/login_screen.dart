import 'package:flutter/material.dart';
import 'package:sewamitra/services/firebase_auth_methods.dart';
import 'package:sewamitra/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[800]!, Colors.blue[300]!],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Circular Logo
                ClipOval(
                  child: Image.asset(
                    'assets/images/sewa-mitra-logo.png',
                    height: 150, // Adjust size as needed
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),

                // Title: "SewaMitra"
                Text(
                  'SewaMitra',
                  style: TextStyle(
                    fontSize: 48, // Increased size
                    fontWeight: FontWeight.bold, // Bold style
                    color: Colors.white,
                    letterSpacing: 3.0, // Increase letter spacing
                    fontFamily: 'Roboto', // Stylish font (you can choose another font)
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // Explanation text about secure Google Sign-In
                Text(
                  'Google Sign-In is secure and easy. Sign in with your Google account to continue using SewaMitra with confidence.',
                  style: TextStyle(
                    fontSize: 18, // Increased font size for readability
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Roboto', // Stylish font
                    letterSpacing: 1.2, // Adjust letter spacing
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
                SizedBox(height: 40),

                // Google Sign-In Button
                CustomButton(
                  onTap: () {
                    context.read<FirebaseAuthMethods>().signInWithGoogle(context);
                  },
                  text: 'Google Sign In',
                ),
                SizedBox(height: 20),

                // Additional text: Privacy & Terms message
                Text(
                  'By signing in, you agree to our privacy policy and terms of service.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Roboto', // Stylish font
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
