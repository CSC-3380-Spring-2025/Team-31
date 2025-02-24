// 
// template_screen.dart
// 
// This is the commented template for screen files.
//

// Always import this essential file
import '../widgets/essential.dart'; // adjust path accordingly

//
// Example 1: Sample Screen Stack
//
// Screen Widget Template
//
class TemplateScreen1A extends StatelessWidget {
  const TemplateScreen1A({super.key});

	@override
	Widget build(BuildContext context) {
    // CustomPageStack structures the entire page, stacking children vertically 
    // in a scrollable column that spans the full device width.
		return CustomPageStack(
      children: [
        // Array of page content (widgets) to be stacked into scrolling column.
        // Widgets prefixed with a "_" are screen-specific (non-reusable)
        _PageHeader(
          text: "This is an example header",
        ),
        Text("This is content on the page."),
      ],
    );
	}
}

//
// Example 2: Screen-Specific Widgets
//
// Screen-Specific Stateless Widget Template 
//
// (non-reusable widgets prefixed with _)
// Define below the primary widget; move reusable widgets to lib/src/widgets/
//
class _PageHeader extends StatelessWidget {
  final String text;

  const _PageHeader({
    super.key,
    required this.text,
  });

	@override
	Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      )
    );
	}
}