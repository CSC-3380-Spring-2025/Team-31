//
// route_handler.dart
// 
// This is the fundamental routing
// system of our app
//

// Required Imports
import '../../main.dart';
import '../assets/essential.dart';
// Screens
import '../screens/home_screen.dart';
import '../screens/create_course_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/card_screen.dart';
import '../screens/view_set_screen.dart';
import '../screens/camera_screen.dart';
import '../screens/flashcard_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart'; //SignInScreen call is located here.

class RouteHandler {
  final String route;

  RouteHandler({
    required this.route
  });

  static final Map<String, Widget> _routeToScreen = {
    '/home': const HomeScreen(),
    '/create_course': const CreateCourseScreen(),
    '/settings': const SettingsScreen(),
    '/login': const SignInScreen(),
    '/quiz': QuizScreen(),
    //'/card': CardScreen(),
    '/view_set': ViewSetScreen(),
    '/camera': CameraScreen(),
    '/flashcards': FlashcardScreen(),
  };

  Widget getScreen() {
    return _routeToScreen[route] ?? const NotFoundScreen();
  }

  static void openRoute(String route) {
    MainScreen(screenWidget: RouteHandler(route: route).getScreen());
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