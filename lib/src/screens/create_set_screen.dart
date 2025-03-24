// 
// create_set_screen.dart
// 
// This is the page where users
// will create new sets.
// 

import '../widgets/essential.dart';
import '../widgets/custom_page_header.dart';

// Primary Screen Layout
class CreateSetScreen extends StatelessWidget {
  const CreateSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageStack(
      children: [
        CustomPageHeader(
          text: "Create Set Page"
        ),
      ]
    );
  }
}