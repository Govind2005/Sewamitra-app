import 'package:flutter/material.dart';
import 'package:sewamitra/screens/base/form_page.dart';
import 'package:sewamitra/screens/base/donation_page.dart';
import 'package:sewamitra/screens/base/other_help.dart';  // Import the DonationPage

class HelpingWays extends StatelessWidget {
  const HelpingWays({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade50,
                  Colors.blue.shade100,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Make a difference',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue, // Changed to blue for better readability
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Help out the unfortunate victims.\nEvery drop counts',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue.shade700, // Darker blue for text readability
                        height: 1.5,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.5,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  List<String> titles = [
                    'Food',
                    'Water',
                    'Medicine',
                    'Beds',
                    'Donation',
                    'Other'
                  ];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          // Check if it's the Donation button and navigate accordingly
                          if (titles[index] == 'Donation') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DonationPage()), // Navigate to DonationPage
                            );
                          } else if (titles[index] == 'Other') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const OtherHelpPage()), // Navigate to OtherHelpPage
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FormPage()), // Navigate to FormPage for other options
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  _getIconForIndex(index),
                                  color: Colors.blue, // Updated icon color to blue
                                  size: 22,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  titles[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue, // Updated text color to blue
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to get icon based on the index
  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.restaurant;
      case 1:
        return Icons.water_drop;
      case 2:
        return Icons.medical_services;
      case 3:
        return Icons.bed;
      case 4:
        return Icons.attach_money;
      case 5:
        return Icons.add;
      default:
        return Icons.help;
    }
  }
}
