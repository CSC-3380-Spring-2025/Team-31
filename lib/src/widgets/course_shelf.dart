//
// course_shelf.dart
//
// This is an importable
// widget that will display
// a grid of courses the
// current user is subscribed to.
//

import 'package:firebase_auth/firebase_auth.dart';
import "../assets/essential.dart";
import "../assets/database.dart";

class CourseShelf extends StatelessWidget {
  const CourseShelf({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Center(child: Text('Please sign in to view your courses.'));
    }

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: dbService.getUserCourses(user.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final courses = snapshot.data ?? [];
        if (courses.isEmpty) {
          return const Center(child: Text('No courses found.'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 3 / 2, // Adjusts the button shape
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return ElevatedButton(
              onPressed: () {
                // Navigate to a course detail screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailScreen(course: course),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                course['title'] ?? 'Untitled Course',
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      },
    );
  }
}

// Placeholder for the course detail screen
class CourseDetailScreen extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course['title'] ?? 'Course Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Course: ${course['title'] ?? 'Untitled'}'),
            Text('Author: ${course['author'] ?? 'Unknown'}'),
            Text('Education Level: ${course['education_level']?.toString() ?? 'N/A'}'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to a study session screen (e.g., FlashcardStudySessionScreen)
                // Replace with your actual study session screen
              },
              child: const Text('Start Studying'),
            ),
          ],
        ),
      ),
    );
  }
}