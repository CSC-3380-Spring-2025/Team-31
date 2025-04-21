// 
// view_set_screen.dart
// 
// This is the empty screen file template.
//

import '../assets/essential.dart';
import '../widgets/back_button.dart';
import '../widgets/section_label.dart';
import '../widgets/view_set_cards_preview.dart';
import '../widgets/view_set_quick_action_grid.dart';

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
            ViewSetQuickActionButtonGrid()
          ],
        ),
      ),
    );
  }
}