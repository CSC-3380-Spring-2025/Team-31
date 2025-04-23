//
// course_set_scroll.dart
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
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 24.0),
        itemCount: sets.length,
        itemBuilder: (context, index) {
          final set = sets[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 180.0,
              child: _SetButton(
                title: set['title'] ?? set['id'],
                route: '/view_set',
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SetButton extends StatelessWidget {
  final String title;
  final String route;

  const _SetButton({required this.title, required this.route});

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
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}