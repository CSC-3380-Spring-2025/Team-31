//
// section_label.dart
//
// This is widget of a
// section label, just a
// stylized piece of text.
//

import '../assets/essential.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 12.0, 32.0, 0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}