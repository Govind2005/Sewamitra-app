import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sewamitra/firebase_options.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController donationAmountController = TextEditingController();  // Controller for donation amount
  DateTime? selectedDate;

  Future<void> _submitDonation() async {
    try {
      print('Attempting to submit donation...');
      print('Donation Amount: ${donationAmountController.text}');  // Donation amount

      // Validate inputs
      if (donationAmountController.text.isEmpty || double.tryParse(donationAmountController.text) == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid donation amount')),
        );
        return;
      }

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      // Create the donation document
      await FirebaseFirestore.instance.collection('donations').add({
        'donationAmount': double.parse(donationAmountController.text.trim()),  // Add donation amount
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Close loading indicator
      Navigator.pop(context);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Donation submitted successfully!'),
          backgroundColor: Colors.blue,
        ),
      );

      // Clear the form
      donationAmountController.clear();  // Clear the donation amount field

      print('Donation submitted successfully!');
    } catch (e) {
      print('Error details: $e');
      // Close loading indicator
      Navigator.pop(context);

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting donation: $e'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error submitting donation: $e');
    }
  }

  @override
  void dispose() {
    donationAmountController.dispose();  // Dispose the donation amount controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Remove the debug banner
      theme: ThemeData(
        primaryColor: Colors.blue,  // Change to blue
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0),
          ),
          labelStyle: TextStyle(color: Colors.blue),
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Make a Donation for Disaster Relief',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Your generous donation can make a difference in the lives of those affected by the disaster. Please enter the amount you would like to donate below.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade700,
                  ),
                ),
                SizedBox(height: 30),
                _buildTextField('Donation Amount', TextInputType.number, donationAmountController),  // Donation amount input
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitDonation,
                    child: Text('Donate Now'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextInputType inputType, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Enter $label',
        filled: true,
        fillColor: Colors.blue.shade50,  // Light blue background for input
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DonationPage());
}
