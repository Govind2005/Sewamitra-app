import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:sewamitra/chatbot/gemini_service.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _calamityController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String _response = '';
  bool _isLoading = false;

  void _handleSubmit() async {
    String place = _placeController.text.trim();
    String calamity = _calamityController.text.trim();
    String time = _timeController.text.trim();

    if (place.isEmpty || calamity.isEmpty || time.isEmpty) {
      setState(() {
        _response = "Please fill in all fields.";
      });
      return;
    }

    String prompt =
        "I am at $place, which has been hit with a $calamity at $time time of the day. "
        "What are the steps I must follow? Please keep them concise and easy to read.";

    // print("Generated prompt: $prompt");

    setState(() {
      _isLoading = true;
      _response = '';
    });

    try {
      String response = await GeminiService().getResponse(prompt);
      setState(() {
        _response = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Disaster Management Assistant')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Location Input
            TextField(
              controller: _placeController,
              decoration: InputDecoration(
                labelText: 'Enter your location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Calamity Type Input
            TextField(
              controller: _calamityController,
              decoration: InputDecoration(
                labelText: 'Type of calamity (e.g., earthquake, flood)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Time of the Day Input
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Time of the day (e.g., morning, night)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Get Safety Instructions'),
            ),
            SizedBox(height: 20),

            // Show loading indicator
            if (_isLoading) CircularProgressIndicator(),

            // Response Display
            if (_response.isNotEmpty)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    child: MarkdownBody(
                        data: _response), // Render formatted response
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
