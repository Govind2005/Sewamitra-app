import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String apiKey = 'AIzaSyC4Wm4h_bcvc2IsAH91Kvm1y2OITfRq-tM';
  String get apiUrl =>
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

  Future<String> getResponse(String query) async {
    print('Sending request to Gemini AI');
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": query}
            ]
          }
        ]
      }),
    );

    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception(
          'Failed to get response from Gemini AI: Response Status: ${response.statusCode}');
    }
  }
}
