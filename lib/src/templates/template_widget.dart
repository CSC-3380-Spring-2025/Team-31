// 
// template_widget.dart
// 
// This is the commented template for widget files.
//

// Always import this essential file
import '../assets/essential.dart'; // adjust path accordingly

//
// Example 1: Stateless Widget
//
// Stateless Widget Template
//
class TemplateStatelessWidget extends StatelessWidget {
  const TemplateStatelessWidget({super.key});

	@override
	Widget build(BuildContext context) {
    return Text("Placeholder");
	}
}

//
// Example 2: Stateful Widget
//
// Stateful Widget Template
//
class TemplateStatefulWidget extends StatefulWidget {
  const TemplateStatefulWidget({super.key});

	@override
	State<TemplateStatefulWidget> createState() => _TemplateStatefulWidgetState();
}

class _TemplateStatefulWidgetState extends State<TemplateStatefulWidget> {
  @override
  Widget build(BuildContext build) {
    return Text("Placeholder");
  }
}