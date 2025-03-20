import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewamitra/services/firebase_auth_methods.dart';
import 'package:sewamitra/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      // Background image for the homepage
      body: Stack(
        children: [
          // Background image from network
          Positioned.fill(
            child: Image.network(
              'https://marketplace.canva.com/EAF09yyc0Vc/1/0/450w/canva-brown-beige-aesthetic-leaf-phone-wallpaper-vOC17t8JsWk.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Content with transparency to overlay text
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4), // Transparent overlay to make text readable
            ),
          ),

          // Main content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title section with a large heading
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    'SewaMitra',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),

                // Subtitle with some description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Uniting India in Crisis Response',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Description about the app
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Empowering communities across India with real-time disaster management solutions, connecting emergency services, volunteers, and those in need during critical times.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.5,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // "Our Services" section with a box around it
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Our Services',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Get Help Now',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Button to get help
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Get Help Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Sign Out Button
                SizedBox(height: 40), // Adds some space before the button
                CustomButton(
                  onTap: () {
                    context.read<FirebaseAuthMethods>().signOut(context);
                  },
                  text: 'Sign Out',
                ),

                // Delete Account Button
                SizedBox(height: 20), // Adds some space before the button
                CustomButton(
                  onTap: () {
                    context.read<FirebaseAuthMethods>().deleteAccount(context);
                  },
                  text: 'Delete Account',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
