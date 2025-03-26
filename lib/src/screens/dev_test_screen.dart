// 
// dev_test_screen.dart
// 
// Development testing page
// 

import '../widgets/essential.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/custom_button_shelf.dart';

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