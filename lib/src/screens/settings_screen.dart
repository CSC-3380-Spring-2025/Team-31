// 
// settings_screen.dart
// 
// This is the settings page.
// 

import '../assets/essential.dart';
import '../assets/ai-model.dart';

// Primary Screen Layout
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getGeminiResponse("what is 4+2?"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text('Response: ${snapshot.data}');
        }
      },
    );
  }
}