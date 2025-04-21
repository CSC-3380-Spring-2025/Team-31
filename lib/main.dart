//
// main.dart
//
// This is the main entry point
// for the application.
//

// System Imports
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/Firebase_ui_oauth_google.dart';
import 'firebase_options.dart';
// Widgets / Libraries
import 'src/assets/essential.dart';
import 'src/assets/database.dart';
import 'src/assets/screens.dart';
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
        brightness: Brightness.dark,
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
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading Indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // IF Logged In
        if (snapshot.hasData) {
          // Get User Object & Create Document
          final user = snapshot.data!;
          dbService.createUserDocument(user).catchError((e) {
            print('Error creating user document: $e');
          });
          // Send to Home Screen
          return MainScreen(screenWidget: RouteHandler(route: "/home").getScreen());
        }
        // IF Logged Out
        else {
          return SignInScreen(
            //avenues for authentication set up through firebase for out program
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: '34811750205-4rmsh2v96o4qisaakn6mi1c531f6qn3m.apps.googleusercontent.com'),
            ],
            headerBuilder: (context, constraints, shrinkOffset){
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('lib/src/assets/study_hall_icon.png')
                )
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top:16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.', //would love to add some sarcasm here
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder:(context, shrinkOffSet){
              return Padding(
                padding:const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('lib/src/assets/study_hall_icon.png')
                )
              );
            },
          );
        }
      },
    );
  }
}

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
            // Begin: Do Not Change!
            // Modify navbar items through: navbar_items.dart
            ...navItems.map((navItem) {
              // Remove unnecessary items if user logged out
              if (navItem.requiresAuth && user == null) {
                return const SizedBox.shrink();
              }
              // Each navbar item object
              return ListTile(
                leading: Icon(navItem.icon),
                title: Text(navItem.title),
                onTap: () {
                  Navigator.pushNamed(context, navItem.route);
                },
              );
            }).toList(),
            // End: Do Not Change!
          ],
        ),
      ),
    );
  }
}
