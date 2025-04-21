//
// navbar_item.dart
// 
// Navbar Item Widget

// Required Imports
import 'package:study_hall/src/screens/quiz_screen.dart';

import '../assets/essential.dart';
// Screens
import '../screens/home_screen.dart';
import '../screens/create_set_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/view_set_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; //SignInScreen call is located here.

class RouteHandler {
  final String route;

  RouteHandler({
    required this.route
  });

  static final Map<String, Widget> _routeToScreen = {
    '/home': const HomeScreen(),
    '/create_set': const CreateSetScreen(),
    '/settings': const SettingsScreen(),
    '/login': const SignInScreen(),
    '/quiz': QuizScreen(),
    '/view_set': ViewSetScreen(),
  };

  Widget getScreen() {
    return _routeToScreen[route] ?? const NotFoundScreen();
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: const Center(
        child: Text(
          '404: Page Not Found',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}