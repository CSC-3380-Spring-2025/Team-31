// 
// main.dart
// 
// This is the main entry point
// for the application.
// 

// System
import 'package:flutter/material.dart';
create-screens

import 'firebase_options.dart';
// Screens
import 'src/screens/camera_screen.dart';
import 'src/screens/voice_screen.dart';
import 'src/screens/login_screen.dart';
// Widgets / Libraries
import 'src/widgets/auth_gate.dart';
import 'src/assets/essential.dart';
import 'src/assets/screens.dart';
 main

void main() {
	runApp(const MyApp());
}

// Main App Object
//
// Material Config
// Routing + Theme
class MyApp extends StatelessWidget {
	const MyApp({super.key});
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
      // home: const AuthGate(),
			title: "Flashcard App",
			initialRoute: '/home',
			routes: <String, WidgetBuilder>{
				'/home': (BuildContext context) => MainScreen(screenIndex: 0),
				'/create_set': (BuildContext context) => MainScreen(screenIndex: 1),
				'/settings': (BuildContext context) => MainScreen(screenIndex: 2),
        '/card_screen': (BuildContext context) => MainScreen(screenIndex: 0),
        '/login': (BuildContext context) => MainScreen(screenIndex: 3),
			},
			theme: ThemeData(
				brightness: Brightness.dark,
				primaryColor: Colors.blueGrey,
			)
		);
	}
}

// Stateful widget for the app's main navigation container
class MainScreen extends StatefulWidget {
	final int screenIndex;

	const MainScreen({
    super.key, 
    required this.screenIndex
  });

	@override
	State<MainScreen> createState() => _MainStateScreen();
}

// State manager for MainScreen, handling screen selection
class _MainStateScreen extends State<MainScreen> {
  // Active Page Index
	late int _selectedIndex = 0;

  // List of Screen Views (Bottom Nav Bar, in order)
	static const List<Widget> _screens = [
		HomeScreen(),
    CreateSetScreen(),
    SettingsScreen(),
    LoginScreen(),
	];

  // Fetches screenIndex from MainScreen
	@override
	void initState() {
		super.initState();
		_selectedIndex = widget.screenIndex;
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      appBar: AppBar(title: const Text('Study Hall')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 128,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('Navigation')
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Set'),
              onTap: () {
                Navigator.pushNamed(context, '/create-set');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        )
      ),
    );
    
  }
}