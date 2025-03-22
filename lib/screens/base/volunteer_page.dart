import 'package:flutter/material.dart';
import 'package:sewamitra/screens/base/helping_ways.dart';
import 'package:sewamitra/widgets/custom_button.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
