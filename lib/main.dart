// 
// main.dart
// 
// This is the main entry point
// for the application.
// 

import 'src/widgets/essential.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/create_set_screen.dart';
import 'src/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'src/screens/camera_screen.dart';
import 'src/screens/voice_screen.dart';

void main() {
	runApp(const MyApp());
}

// Material App Framework
class MyApp extends StatelessWidget {
	const MyApp({super.key});
	
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Flashcard App",
			initialRoute: '/',
			routes: <String, WidgetBuilder>{
				'/': (BuildContext context) => MainScreen(screenIndex: 0),
				'/home': (BuildContext context) => MainScreen(screenIndex: 0),
				'/create_set': (BuildContext context) => MainScreen(screenIndex: 1),
				'/settings': (BuildContext context) => MainScreen(screenIndex: 2),
        '/card_screen': (BuildContext context) => MainScreen(screenIndex: 3,),
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
    
	];

  // Fetches screenIndex from MainScreen
	@override
	void initState() {
		super.initState();
		_selectedIndex = widget.screenIndex;
	}

  // Updates _selectedIndex onTap
	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
    // Main Application Scaffold
		return Scaffold(
			body: _screens[_selectedIndex],
			bottomNavigationBar: BottomNavigationBar(
				items: const [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						label: "Home"
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.add),
						label: "Create Set"
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.settings),
						label: "Settings"
					),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Cards")
				],
				currentIndex: _selectedIndex,
				onTap: _onItemTapped,
				selectedItemColor: Theme.of(context).primaryColor,
				unselectedItemColor: Colors.grey,
			),
		);
	}
}