//
// back_button.dart
//
// This is a back button.
// Takes in custom icon + text
//

import '../assets/essential.dart';

class ReturnButton extends StatelessWidget{
  final IconData icon;
  final String text;

  const ReturnButton({super.key, this.icon = Icons.arrow_back, this.text = "Back"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(icon),
        label: Text(text),
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}