// 
// dev_test_screen.dart
// 
// Development testing page
// 

import '../assets/essential.dart';

// Primary Screen Layout
class DevTestScreen extends StatelessWidget {
  const DevTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageStack(
      children: [
        CustomPageHeader(
          text: "Development"
        ),
      ]
    );
  }
}