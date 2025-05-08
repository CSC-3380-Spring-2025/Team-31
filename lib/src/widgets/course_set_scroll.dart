//
// course_set_scroll.dart
//
//

import '../assets/essential.dart';
import '../assets/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseSetScroll extends StatelessWidget {
  final ValueNotifier<String?> selectedCourseId;

  const CourseSetScroll({super.key, required this.selectedCourseId});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedCourseId,
      builder: (context, courseId, _) {
        if (courseId == null) {
          return const SizedBox.shrink();
        }
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: dbService.getSetsInCourse(courseId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }
            final sets = snapshot.data!;
            return _ScrollBox(sets: sets);
          },
        );
      },
    );
  }
}

class _ScrollBox extends StatelessWidget {
  final List<Map<String, dynamic>> sets;

  const _ScrollBox({required this.sets});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 24.0),
      child: Row(
        children: sets.map((set) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IntrinsicWidth(
              child: _SetButton(
                title: set['title'] ?? "Empty Title",
                section: set['section'] ?? "Empty Section",
                route: '/view_set',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SetButton extends StatelessWidget {
  final String title;
  final String section;
  final String route;

  const _SetButton({
    required this.title, 
    required this.section, 
    required this.route
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onOpenSet(context),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0), // Modify this padding value as needed
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 0, 0, 0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0, 
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
            Text(
              section,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300, 
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOpenSet(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedSet', '{"title": "$title", "section": "$section"}');
    Navigator.pushNamed(context, route);
  }
}