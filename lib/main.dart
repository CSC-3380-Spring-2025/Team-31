//
// main.dart
//
// This is the main entry point
// for the application.
//

// System Imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'firebase_options.dart';
// Asset Imports
import 'src/assets/essential.dart';
import 'src/assets/database.dart';
// Widget Imports
import 'src/widgets/auth_gate.dart';
import 'src/widgets/route_handler.dart';
import 'src/widgets/navbar_items.dart';

// Main Entry Function
void main() async {
  // Firebase Authentication Stuff
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Main App
  runApp(const MyApp());
}

// Main App Object
// Material Config, Routing + Theme
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flashcard App",
      theme: ThemeData(
        brightness: Brightness.light, // Changed to light mode
        primaryColor: Colors.blueGrey,
      ),
      home: const AuthGate(),
      onGenerateRoute: (settings) {
        final routeName = settings.name ?? '/home';
        final screen = RouteHandler(route: routeName).getScreen();
        return MaterialPageRoute(
          builder: (context) => MainScreen(screenWidget: screen),
          settings: settings,
        );
      },
    );
  }
}

// Authentication Handler


// Stateful widget for the app's main navigation container
class MainScreen extends StatefulWidget {
  final Widget screenWidget;

  const MainScreen({
    super.key, 
    required this.screenWidget
  });

  @override
  State<MainScreen> createState() => _MainStateScreen();
}

// State manager for MainScreen, handling screen selection
class _MainStateScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? '';

    return Scaffold(
      body: widget.screenWidget,
      appBar: AppBar(title: const Text('Study Hall')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 128,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('Navigation'),
              ),
            ),
            ...NavItem.getNavbarElements(context, user),
          ],
        ),
      ),
    );
  }
}
