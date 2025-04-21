//
// view_set_cards_preview.dart
//
// This widget is the horizontal
// scroll preview of cards of a
// set.
//
// Buggy! Not Functional!
//

import '../assets/essential.dart';

// Wrapper for Grid of Buttons
class ViewSetQuickActionButtonGrid extends StatelessWidget {
  ViewSetQuickActionButtonGrid({super.key});

  // Array of Grid Buttons
  final List<Map<String, dynamic>> buttons = [
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
  ];

  // Build Grid of Buttons
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Column Count
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 24.0), // 12.0 for SectionLabel
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.75, // Button Aspect Ratio
      children: buttons.map((button) {
        // Builds Each Grid Button
        return _GridButton(
          icon: button['icon'], 
          text: button['label'],
          route: button['route']
        );
      }).toList(),
    );
  }
}

// Each Individual Grid Button
class _GridButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const _GridButton({
    required this.icon,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      onHover: (isHovered) {
        // Optional: Add hover effect logic if needed
      },
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 0, 0, 0), // Transparent Black
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Icon(
              icon,
              size: 30.0,
              color: Colors.white,
            ),
            // Spacing between Icon & Label
            const SizedBox(height: 8.0),
            // Label
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}