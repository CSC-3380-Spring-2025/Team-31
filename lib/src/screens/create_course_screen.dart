//
// create_set_screen.dart
//
// This is the page where users
// will create new courses.
//

import '../assets/essential.dart';
import '../widgets/custom_page_stacks.dart';
import '../widgets/back_button.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageStack(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              ReturnButton(),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Course Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
              labelText: 'Secondary Label (e.g., class number)',
              border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                items: ['High School', 'College', 'Graduate']
                .map(
                  (level) => DropdownMenuItem(
                value: level,
                child: Text(level),
                  ),
                )
                .toList(),
                onChanged: (value) {},
                decoration: InputDecoration(
              labelText: 'Education Level',
              border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
                },
                child: const Text("Create"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
