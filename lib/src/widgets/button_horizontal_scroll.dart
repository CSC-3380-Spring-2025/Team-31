//
// course_set_scroll.dart
//

import '../assets/essential.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonHorizontalScroll extends StatelessWidget {
  final List<Map<String, dynamic>> buttons;

  const ButtonHorizontalScroll({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 24.0),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final button = buttons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 180.0,
              child: _ScrollButton(
                icon: button['icon'],
                text: button['label'],
                route: button['route'],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ScrollButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const _ScrollButton({
    required this.icon,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 0, 0, 0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30.0, color: Colors.white),
            const SizedBox(height: 8.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}