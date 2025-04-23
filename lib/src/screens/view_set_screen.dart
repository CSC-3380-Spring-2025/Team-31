// 
// view_set_screen.dart
// 
// This is the empty screen file template.
//

import '../assets/essential.dart';
import '../widgets/back_button.dart';
import '../widgets/section_label.dart';
import '../widgets/view_set_cards_preview.dart';
import '../widgets/button_grid.dart';

class ViewSetScreen extends StatelessWidget {
  const ViewSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPageStack(
          children: [
            // Button: Back to Home
            ReturnButton(),
            // Set Preview Scroll
            SectionLabel(text: "An Example Set"),
            SizedBox(
              height: 300,
              child: ViewSetPreviewScroll(),
            ),
            // Quick Action Button Grid
            SectionLabel(text: "Quick Actions"),
            ButtonGrid(
              buttons: [
                {
                  'icon': Icons.book, 
                  'label': 'Flashcards',
                  'route': '/flashcards'
                },
                {
                  'icon': Icons.quiz, 
                  'label': 'Quiz Yourself',
                  'route': '/quiz'
                },
                {
                  'icon': Icons.edit, 
                  'label': 'Edit Set',
                  'route': '/edit_set'
                },
                {
                  'icon': Icons.people, 
                  'label': 'Group Study',
                  'route': '/group_study'
                },
                {
                  'icon': Icons.share, 
                  'label': 'Share Set',
                  'route': '/share_set'
                },
                {
                  'icon': Icons.delete, 
                  'label': 'Delete Set',
                  'route': '/delete_set'
                },
              ]
            )
          ],
        ),
      ),
    );
  }
}