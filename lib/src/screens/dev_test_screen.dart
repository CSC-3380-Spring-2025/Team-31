// 
// dev_test_screen.dart
// 
// Development testing page
// 

import '../assets/essential.dart';
import '../assets/database.dart';

// Primary Screen Layout
class DevTestScreen extends StatelessWidget {
  const DevTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageStack(
      children: [
        Container(
          padding: const EdgeInsets.all(24.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add logic for "Get Password" button here
                },
                child: const Text('Get Password'),
              ),
            ]
          )
        )

      ]
    );
  }
}