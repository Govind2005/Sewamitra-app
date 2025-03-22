import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade300, width: 1.0),
          ),
          labelStyle: TextStyle(color: Colors.red),
          hintStyle: TextStyle(color: Colors.grey.shade600),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order Form'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Order Form',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField('Quantity', TextInputType.number),
                SizedBox(height: 20),
                _buildDateField(context, 'Expected Date'),
                SizedBox(height: 20),
                _buildTextField('Comments (Optional)', TextInputType.text),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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

  Widget _buildTextField(String label, TextInputType inputType) {
    return TextField(
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Enter $label',
        filled: true,
        fillColor: Colors.red.shade50,
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Pick a date',
        filled: true,
        fillColor: Colors.red.shade50,
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Colors.red,
        ),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          print(pickedDate);  // Here you can assign it to a variable if needed
        }
      },
    );
  }
}

void main() {
  runApp(FormPage());
}
