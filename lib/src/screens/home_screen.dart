// 
// home_screen.dart
// 
// This is the landing page for all users
// when starting the app.
// 

import 'package:flashcard_app/src/widgets/horizontal_scroll.dart';

import '../widgets/essential.dart';
import '../widgets/custom_page_header.dart';
import '../widgets/custom_button_shelf.dart';

// Primary Screen Layout
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Add list of 
  @override
  Widget build(BuildContext context) {
    // return CustomPageStack(
    //   children: [
    //     CustomPageHeader(
    //       text: "Select a Set"
    //     ),
    //     CustomButtonShelf(
    //       label: "Quick Actions",
    //     ),
    //   ]
    // );

    return Scaffold(
      appBar: AppBar(title: const Text('Select a set')),
      body: Center(
        child: HorizontalScroll()
      ) 
    );
  }
}