// 
// main.dart
// 
// This is the main entry point
// for the application.
// 

import 'package:flutter/material.dart';
import 'src/screens/camera_screen.dart';
import 'src/screens/voice_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/widgets/auth_gate.dart';
import 'src/assets/essential.dart';
import 'src/assets/screens.dart';

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
      home: const AuthGate(),
			title: "Flashcard App",
			initialRoute: '/',
			routes: <String, WidgetBuilder>{
				'/': (BuildContext context) => MainScreen(screenIndex: 0),
				'/home': (BuildContext context) => MainScreen(screenIndex: 0),
				'/create_set': (BuildContext context) => MainScreen(screenIndex: 2),
				'/settings': (BuildContext context) => MainScreen(screenIndex: 3),
        '/card_screen': (BuildContext context) => MainScreen(screenIndex: 4,),
        '/login_screen': (BuildContext context) => MainScreen(screenIndex: 1),
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

  // Updates _selectedIndex onTap
	void _onItemTapped(int screenIndex) {
		setState(() {
			_selectedIndex = screenIndex;
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex] ?? const Center(child: Text("Screen not found")),
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
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Create Set'),
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                _onItemTapped(3);
              },
            )
          ],
        )
      ),
    );
    
  }
}