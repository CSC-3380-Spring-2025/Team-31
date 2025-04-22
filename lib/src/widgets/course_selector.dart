//
// course_selector.dart
//
// Course Selector Widget
// (Drop down menu)
//

import '../assets/essential.dart';

class CourseSelector extends StatefulWidget {
  const CourseSelector({super.key});

  @override
  _CourseSelectorState createState() => _CourseSelectorState();
}

class _CourseSelectorState extends State<CourseSelector> {
  String _selectedCourse = 'Math'; // Default selection
  final List<String> _courses = ['Math', 'Science', 'History', 'English'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            'Current Course: ',
            style: TextStyle(fontSize: 16),
          ),
          DropdownButton<String>(
            value: _selectedCourse,
            items: _courses.map((String course) {
              return DropdownMenuItem<String>(
                value: course,
                child: Text(course),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCourse = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}