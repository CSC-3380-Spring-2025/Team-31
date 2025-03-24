// 
// settings_screen.dart
// 
// This is the settings page. (Placeholder)
// 

import '../widgets/essential.dart';
import '../widgets/custom_page_header.dart';

// Primary Screen Layout
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageStack(
      children: [
        CustomPageHeader(
          text: "Settings Page"
        ),
      ]
    );
  }
}