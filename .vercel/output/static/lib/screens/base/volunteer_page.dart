import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewamitra/screens/base/helping_ways.dart';
import 'package:sewamitra/screens/login_screen.dart';
import 'package:sewamitra/services/firebase_auth_methods.dart';
import 'package:sewamitra/widgets/custom_button.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser == null) {
      return const LoginScreen();
    }
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Places you could contribute',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 20),

              // Horizontal Scrollable Grid
              Container(
                height: 150, // Height for the horizontal scrollable grid
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildVolunteerCard(context, 'Flood in Kerala'),
                    _buildVolunteerCard(context, 'Cyclone in Orissa'),
                    _buildVolunteerCard(context, 'Landslide in Ladakh'),
                    _buildVolunteerCard(context, 'Drought in Rajasthan'),
                  ],
                ),
              ),

              SizedBox(height: 40), // Adds space before the Sign Out button

              // Sign Out Button
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
                text: 'Sign Out',
              ),

              SizedBox(height: 20), // Adds space before the Delete Account button

              // Delete Account Button
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                },
                text: 'Delete Account',
              ),
              SizedBox(height: 60), // Adds space before the bottom of the screen
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a custom styled volunteer card
  Widget _buildVolunteerCard(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpingWays()),
          );
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.place,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
