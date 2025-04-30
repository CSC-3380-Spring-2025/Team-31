//
// ai-model.dart
//
// Simple AI Model Test
//

import 'package:firebase_vertexai/firebase_vertexai.dart';

Future<String> getGeminiResponse(String prompt) async {
  final model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');
  try {
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text ?? 'No response';
  } catch (e) {
    return 'Error: $e';
  }
}