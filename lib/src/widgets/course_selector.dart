//
// course_selector.dart
//
// Course Selector Widget
// (Drop down menu)
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import '../assets/essential.dart';
import '../assets/database.dart';

class CourseSelector extends StatefulWidget {
  const CourseSelector({super.key});

  @override
  _CourseSelectorState createState() => _CourseSelectorState();
}

class _CourseSelectorState extends State<CourseSelector> {
  String? _selectedCourseId;
  List<Map<String, dynamic>> _courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    debugPrint('User ID: $userId');

    if (userId == null) {
      debugPrint('No user signed in');
      setState(() {
        _courses = [];
        _selectedCourseId = null;
      });
      return;
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
    debugPrint('User Document Exists: ${userDoc.exists}');
    if (userDoc.exists) {
      debugPrint('User Data: ${userDoc.data()}');
    }

    final courses = await dbService.getUserCourses(userId);
    debugPrint('Fetched Courses: $courses');

    setState(() {
      _courses = courses;
      _selectedCourseId = courses.isNotEmpty ? courses[0]['id'] : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text(
            'Current Course: ',
            style: TextStyle(fontSize: 16),
          ),
          _courses.isEmpty && _selectedCourseId == null
              ? const Text('No courses')
              : DropdownButton<String>(
                  value: _selectedCourseId,
                  items: [
                    ..._courses.map((course) => DropdownMenuItem<String>(
                          value: course['id'],
                          child: CourseButton(
                            title: course['title'] ?? 'Course ${course['id']}',
                            courseId: course['id'],
                          ),
                        )),
                    const DropdownMenuItem<String>(
                      value: 'add_course',
                      child: AddCourseButton(),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue == 'add_course') {
                      _addCourse();
                    } else {
                      setState(() {
                        _selectedCourseId = newValue;
                      });
                    }
                  },
                ),
        ],
      ),
    );
  }

  Future<void> _addCourse() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      debugPrint('No user signed in for adding course');
      return;
    }

    try {
      await dbService.createCourse(userId, {
        'title': 'New Course',
      });
      debugPrint('Course created, refreshing courses');
      await _fetchCourses();
    } catch (e) {
      debugPrint('Error adding course: $e');
    }
  }
}

class CourseButton extends StatelessWidget {
  final String title;
  final String courseId;

  const CourseButton({
    super.key,
    required this.title,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0, // Ensure consistent width for dropdown items
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16.0),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class AddCourseButton extends StatelessWidget {
  const AddCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          children: const [
            Icon(Icons.add, size: 20.0),
            SizedBox(width: 8.0),
            Text(
              'Add Course',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}