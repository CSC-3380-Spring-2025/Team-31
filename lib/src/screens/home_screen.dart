// 
// home_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import '../assets/essential.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/custom_button_shelf.dart';

// Primary Screen Layout
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageStack(
      children: [
        CustomPageHeader(
          text: "Home Page"
        ),
        CustomButtonShelf(
          label: "Quick Actions",
        ),
      ]
    );
  }
}