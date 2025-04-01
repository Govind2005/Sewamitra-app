import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sewamitra/firebase_options.dart';

class OtherHelpPage extends StatefulWidget {
  const OtherHelpPage({super.key});

  @override
  State<OtherHelpPage> createState() => _OtherHelpPageState();
}

class _OtherHelpPageState extends State<OtherHelpPage> {
  final TextEditingController assetDescriptionController = TextEditingController();  // Only one controller
  DateTime? selectedDate;

  Future<void> _submitForm() async {
    try {
      print('Attempting to submit form...');
      print('Asset Description: ${assetDescriptionController.text}');  // Only asset description

      // Validate inputs
      if (assetDescriptionController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please tell us about your asset')),
        );
        return;
      }

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      // Create the order document
      await FirebaseFirestore.instance.collection('orders').add({
        'assetDescription': assetDescriptionController.text.trim(),  // Add asset description
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Close loading indicator
      Navigator.pop(context);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order submitted successfully!'),
          backgroundColor: Colors.blue,
        ),
      );

      // Clear the form
      assetDescriptionController.clear();  // Clear the asset description field

      print('Form submitted successfully!');
    } catch (e) {
      print('Error details: $e');
      // Close loading indicator
      Navigator.pop(context);

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting order: $e'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error submitting form: $e');
    }
  }

  @override
  void dispose() {
    assetDescriptionController.dispose();  // Dispose the asset description controller
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
                _buildTextField('Tell us about your asset', TextInputType.text, assetDescriptionController),  // Single text field
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
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
  runApp(const OtherHelpPage());
}
