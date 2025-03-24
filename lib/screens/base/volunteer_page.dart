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
    if(firebaseUser == null) {
      return const LoginScreen();
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpingWays()),
                );
              },
              text: 'Flood in Kerala',
            ),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpingWays()),
                );
              },
              text: 'Cyclone in Orissa',
            ),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpingWays()),
                );
              },
              text: 'Landslide in Ladakh',
            ),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpingWays()),
                );
              },
              text: 'Drought in Rajasthan',
            ),
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
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
