import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sewamitra/firebase_options.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _submitForm() async {
    try {
      print('Attempting to submit form...');
      print('Quantity: ${quantityController.text}');
      print('Date: ${selectedDate?.toIso8601String()}');
      print('Comments: ${commentsController.text}');

      // Validate inputs
      if (quantityController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter quantity')),
        );
        return;
      }

      if (selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a date')),
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
        'quantity': int.tryParse(quantityController.text) ?? 0,
        'expectedDate': selectedDate?.toIso8601String(),
        'comments': commentsController.text.trim(),
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
      quantityController.clear();
      commentsController.clear();
      setState(() {
        selectedDate = null;
      });

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
    quantityController.dispose();
    commentsController.dispose();
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
                _buildTextField(
                    'Quantity', TextInputType.number, quantityController),
                SizedBox(height: 20),
                _buildDateField(context, 'Expected Date'),
                SizedBox(height: 20),
                _buildTextField('Comments (Optional)', TextInputType.text,
                    commentsController),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  Widget _buildTextField(
      String label, TextInputType inputType, TextEditingController controller) {
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

  Widget _buildDateField(BuildContext context, String label) {
    String formattedDate = '';
    if (selectedDate != null) {
      formattedDate =
      '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
    }

    return TextField(
      controller: TextEditingController(text: formattedDate),
      decoration: InputDecoration(
        labelText: '$label *',
        hintText: formattedDate.isEmpty ? 'Pick a date' : null,
        filled: true,
        fillColor: Colors.blue.shade50,  // Light blue background for input
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Colors.blue,  // Icon color change to blue
        ),
        helperText: 'Required',
        helperStyle: TextStyle(color: Colors.blue.shade400),  // Helper text in blue
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.blue,  // Change to blue
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          setState(() {
            selectedDate = pickedDate;
          });
          print('Selected date: $pickedDate'); // Debug print
        }
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FormPage());
}
