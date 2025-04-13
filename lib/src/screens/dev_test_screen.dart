// 
// dev_test_screen.dart
// 
// Development testing page
// 

import '../assets/essential.dart';
import '../assets/database.dart';

Future<String> _fetchPassword(String username) async {
  try {
    DocumentSnapshot userDoc = await dbService.getUserData(username);
    if (userDoc.exists) {
      return (userDoc.data() as Map<String, dynamic>)['password'] ?? 'No password found';
    }
    return 'User not found';
  } catch (e) {
    return 'Error: $e';
  }
}

class DevTestScreen extends StatefulWidget {
  const DevTestScreen({super.key});

  @override
  _DevTestScreenState createState() => _DevTestScreenState();
}

// Primary Screen Layout
class _DevTestScreenState extends State<DevTestScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _password = '';

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
              // Text Field
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              // Submit Button
              ElevatedButton(
                onPressed: () async {
                  String result = await _fetchPassword(_usernameController.text);
                  setState(() {
                    _password = result;
                  });
                },
                child: const Text('Get Password'),
              ),
              const SizedBox(height: 16.0),
              // Password Display
              Text(
                _password.isEmpty ? '' : 'Password: $_password',
                style: const TextStyle(color: Colors.white),
              ),
            ]
          )
        )

      ]
    );
  }
}