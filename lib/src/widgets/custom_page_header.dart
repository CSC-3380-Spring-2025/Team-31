// 
// custom_page_header.dart
// 
// This is a custom page header.
// Large text intended for top of page.
//

import './essential.dart';

class CustomPageHeader extends StatelessWidget {
  final String text;

  const CustomPageHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 0.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}