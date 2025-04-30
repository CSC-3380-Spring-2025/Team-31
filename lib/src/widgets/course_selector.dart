//
// course_selector.dart
//
// Course Selector Widget
// (Drop down menu)
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import '../assets/essential.dart';
import '../assets/database.dart';

class CourseSelector extends StatefulWidget {
  final ValueNotifier<String?> selectedCourseId;

  const CourseSelector({super.key, required this.selectedCourseId});

  @override
  CourseSelectorState createState() => CourseSelectorState();
}

class CourseSelectorState extends State<CourseSelector> {
  String? _selectedCourseId;
  List<Map<String, dynamic>> _courses = [];

  String? get selectedCourseId => _selectedCourseId;

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      setState(() {
        _courses = [];
        _selectedCourseId = null;
        widget.selectedCourseId.value = null;
      });
      return;
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
    final courses = await dbService.getUserCourses(userId);

    setState(() {
      _courses = courses;
      _selectedCourseId = courses.isNotEmpty ? courses[0]['id'] : null;
      widget.selectedCourseId.value = _selectedCourseId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 12.0, 24.0, 12.0),
      child: Row(
        children: [
          const Text(
            'Current Course: ',
            style: TextStyle(fontSize: 16),
          ),
          _courses.isEmpty && _selectedCourseId == null ? const Text('No courses') : DropdownButton<String>(
            value: _selectedCourseId,
            items: [
              ..._courses.map((course) => DropdownMenuItem<String>(
                value: course['id'],
                child: CourseButton(
                  title: course['title'],
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
                  widget.selectedCourseId.value = newValue;
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
      return;
    }

    Navigator.of(context).pushNamed('/create_course');
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
      width: 200.0,
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